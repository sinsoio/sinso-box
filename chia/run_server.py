from flask import Flask, request
import os
from response_model import ResponseModel
from open_db import SqlitDB

app = Flask(__name__)


# 创建
@app.route('/insurance/createUser', methods=['POST'])
def create_user():
    user_name = request.form.get('userName', default='')
    country = request.form.get('country', default='')
    certify_id = request.form.get('certify_id', default='')
    mobile = request.form.get('mobile', default='')
    area_code = request.form.get('area_code', default='')
    email = request.form.get('email', default='')
    amount = request.form.get('amount')
    pool_address = request.form.get('poolAddress')
    cmd = 'cdv decode %s' % pool_address
    pool_hash = os.popen(cmd).read().strip()
    owner_hash = request.form.get('owner_hash')
    clsp_path = os.path.join(os.path.dirname(__file__), 'my_pool.clsp')
    cmd = 'cdv clsp curry %s -a %s -a 0x%s -a 0x%s --treehash' % (clsp_path, amount, pool_hash, owner_hash)
    hash = os.popen(cmd).read().strip()[2:0]
    cmd = 'cdv encode %s --prefix txch' % hash
    address = os.popen(cmd).read().strip()
    with SqlitDB() as cur:
        cur.execute("INSERT INTO user (user_name,country,certify_id,mobile,area_code,email,hash,pool_hash) VALUES('%s','%s','%s','%s','%s','%s','%s','%s')"
                    % (user_name, country, certify_id, mobile, area_code, email, hash, pool_hash))
    return ResponseModel(data=address).to_json()


# 获取币
@app.route('/insurance/getCoins', methods=['GET'])
def get_coins():
    address = request.args.get('address')
    cmd = 'cdv decode %s' % address
    hash = os.popen(cmd).read().strip()
    cmd = 'cdv rpc coinrecords --by puzhash %s -s 584873' % hash
    res = os.popen(cmd).read().strip()
    print(type(res))
    return ResponseModel(data=res).to_json()


# 加入医保池
@app.route('/insurance/joinInsurancePool', methods=['POST'])
def join_insurance_pool():
    address = request.args.get('address')
    with SqlitDB() as cur:
        cur.execute("SELECT hash FROM user WHERE address='%s'" % address)
        data = cur.fetchall()
        if len(data) == 1:
            hash = data[0][0]
    cmd = 'cdv rpc coinrecords --by puzhash %s -s 584873' % hash
    res = os.popen(cmd).read().strip()
    join_insurance_pool_data = ""
    cmd = "cdv inspect spendbundles %s -db" % join_insurance_pool
    res = os.popen(cmd).read().strip()
    return ResponseModel(data=res).to_json()


# 创建医保池
@app.route('/insurance/createInsurancePool', methods=['POST'])
def create_insurance_pool():
    amount = request.form.get('amount')
    clsp_path = os.path.join(os.path.dirname(__file__), 'my_pool.clsp')
    cmd = 'cdv clsp curry %s -a %s -a 2000 --treehash' % (clsp_path, amount)
    hash = os.popen(cmd).read().strip()
    cmd = 'cdv encode %s  --prefix txch' % hash
    address = os.popen(cmd).read().strip()
    with SqlitDB() as cur:
        cur.execute("INSERT INTO pool (name,amount,address,hash) VALUES('%s','%s','%s','%s')"
                    % ('sinso', amount, address, hash))
    return ResponseModel(data=address).to_json()


# 获取医保池信息
@app.route('/insurance/pool_info', methods=['GET'])
def pool_info():
    with SqlitDB() as cur:
        cur.execute("SELECT id,name,amount,address,hash FROM pool")
        data = cur.fetchall()
        desc = cur.description
        result = [dict(zip([col[0] for col in desc], row)) for row in data]
    return ResponseModel(result).to_json()


# 报销
@app.route('/insurance/claims', methods=['POST'])
def claims():
    claims_spend_bundle_data = ""
    cmd = "cdv inspect spendbundles %s -db" % claims_spend_bundle_data
    res = os.popen(cmd).read().strip()
    return ResponseModel(res).to_json()


@app.route('/convertHashToAddress', methods=['GET'])
def convert():
    # "b5ed7593aab65d28a853347e78398d556f3a4a1913d73e546477cf4466b020c9"
    hash = request.args.get('hash')
    cmd = 'cdv encode %s --prefix txch' % hash
    address = os.popen(cmd).read().strip()
    print(address)
    return ResponseModel(data=address).to_json()


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=7777)
