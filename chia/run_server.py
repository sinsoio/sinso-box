from flask import Flask, request
import os
import json
from response_model import ResponseModel
from open_db import SqlitDB

app = Flask(__name__)


# 创建
# 返回个人医保地址
@app.route('/insurance/createUser', methods=['POST'])
def create_user():
    user_name = request.form.get('userName', default='')
    country = request.form.get('country', default='')
    certify_id = request.form.get('certify_id', default='')
    mobile = request.form.get('mobile', default='')
    with SqlitDB() as cur:
        cur.execute("SELECT hash FROM user WHERE mobile='%s'" % mobile)
        print('cur.fetchall()',cur.fetchall())
        data = cur.fetchall()
        if len(data) >0:
            data=data[0]
        if len(data) > 0:
            hash = data[0]
            cmd = 'cdv encode %s --prefix txch' % hash
            address = os.popen(cmd).read().strip()
            return ResponseModel(data=address).to_json()
    area_code = request.form.get('area_code', default='')
    email = request.form.get('email', default='')
    amount = request.form.get('amount')
    pool_address = request.form.get('poolAddress')
    cmd = 'cdv decode %s' % pool_address
    pool_hash = os.popen(cmd).read().strip()
    print('pool_hash',pool_hash)
    if not pool_hash:
        return ResponseModel(message='Get pool hash failed', code=201).to_json()
    owner_hash = request.form.get('owner_hash')
    wallet_addr = request.form.get('wallet_addr')
    clsp_path = os.path.join(os.path.dirname(__file__), 'personal_pool.clsp')
    cmd = 'cdv clsp curry %s -a %s -a 0x%s -a 0x%s --treehash' % (clsp_path, amount, pool_hash, owner_hash)
    hash = os.popen(cmd).read().strip()
    if not hash:
        return ResponseModel(message='Curry failed', code=201).to_json()
    cmd = 'cdv encode %s --prefix txch' % hash
    print(cmd)
    address = os.popen(cmd).read().strip()
    print('address:',address)
    cmd = 'cdv clsp curry %s -a %s -a 0x%s -a 0x%s -x' % (clsp_path, amount, pool_hash, owner_hash)
    puzzle_reveal = os.popen(cmd).read().strip()
    if not address:
        return ResponseModel(message='Get address failed', code=201).to_json()
    with SqlitDB() as cur:
        cur.execute("INSERT INTO user (user_name,country,certify_id,mobile,area_code,email,hash,pool_hash,wallet_addr,puzzle_reveal) VALUES('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"
                    % (user_name, country, certify_id, mobile, area_code, email, hash, pool_hash, wallet_addr, puzzle_reveal))
    return ResponseModel(data=address).to_json()


# 获取币
@app.route('/insurance/getCoins', methods=['GET'])
def get_coins():
    address = request.args.get('address')
    cmd = 'cdv decode %s' % address
    hash = os.popen(cmd).read().strip()
    if not hash:
        return ResponseModel(message='Decode address failed', code=201).to_json()
    cmd = 'cdv rpc coinrecords --by puzhash %s -s 584873' % hash
    res = os.popen(cmd).read().strip()
    res = json.loads(res)
    sum = 0
    for i in res:
        if not i['spent']:
            sum += i['coin']['amount']
    return ResponseModel(data=str(sum)).to_json()


# 加入医保池
@app.route('/insurance/joinInsurancePool', methods=['POST'])
def join_insurance_pool():
    address = request.form.get('address')
    cmd = 'cdv decode %s' % address
    hash = os.popen(cmd).read().strip()
    puzzle_reveal = ''
    with SqlitDB() as cur:
        cur.execute("SELECT puzzle_reveal FROM user WHERE hash='%s'" % hash)
        data = cur.fetchall()
        if len(data[0]) > 0:
            puzzle_reveal = data[0][0]
    cmd = 'cdv rpc coinrecords --by puzhash %s -s 584873' % hash
    res = os.popen(cmd).read().strip()
    res = json.loads(res)
    sum = 0
    coin_spends = []
    for i in range(0, len(res)):
        if not res[i]['spent']:
            sum += res[i]['coin']['amount']
            parent_coin_info=res[i]['coin']['parent_coin_info'][2:]
            puzzle_hash=res[i]['coin']['puzzle_hash'][2:]
            amount=res[i]['coin']['amount']
            cmd = 'opc "(0x%s %d %d)"' % (hash, (sum-1000) if i == len(res)-1 else 0, 1 if i == len(res)-1 else 0)
            print('solution' , cmd)
            solution = os.popen(cmd).read().strip()
            coin_info =  {"coin": {"parent_coin_info":parent_coin_info, "puzzle_hash": puzzle_hash, "amount": amount}, "puzzle_reveal": puzzle_reveal, "solution": solution}
            coin_spends.append(coin_info)
    join_insurance_pool_data = {"coin_spends":coin_spends,  "aggregated_signature": "0xc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"}
    path = os.path.join(os.path.dirname(__file__), 'joinInsurancePool.json')
    with open(path, 'w') as f:
        f.write(json.dumps(join_insurance_pool_data))
    cmd = "cdv rpc pushtx %s " % path
    print('pushtx----------:',cmd)
    res = os.popen(cmd).read().strip()
    if not res:
        return ResponseModel(message='claims failed', code=201).to_json()
    return ResponseModel(data=json.loads(res)).to_json()


# 创建医保池
@app.route('/insurance/createInsurancePool', methods=['POST'])
def create_insurance_pool():
    name = request.form.get('name')
    stakeAmount = request.form.get('stakeAmount')
    maxClaimeAmount = request.form.get('maxClaimeAmount')
    clsp_path = os.path.join(os.path.dirname(__file__), 'insurance_pool.clsp')
    cmd = 'cdv clsp curry %s -a %s -a %s --treehash' % (clsp_path, stakeAmount,maxClaimeAmount)
    hash = os.popen(cmd).read().strip()
    if not hash:
        return ResponseModel(message='Curry failed', code=201).to_json()

    cmd = 'cdv clsp curry %s -a %s -a %s -x' % (clsp_path, stakeAmount,maxClaimeAmount)
    puzzle_reveal = os.popen(cmd).read().strip()

    cmd = 'cdv encode %s  --prefix txch' % hash

    address = os.popen(cmd).read().strip()
    if not address:
        return ResponseModel(message='Encode hash failed', code=201).to_json()
    with SqlitDB() as cur:
        cur.execute("INSERT INTO pool (name,stakeAmount,maxClaimeAmount,address,hash,puzzle_reveal) VALUES('%s','%s','%s','%s','%s','%s')"
                    % (name, stakeAmount,maxClaimeAmount, address, hash,puzzle_reveal))
    return ResponseModel(data=address).to_json()


# 获取医保池信息
@app.route('/insurance/poolInfo', methods=['GET'])
def pool_info():
    with SqlitDB() as cur:
        cur.execute("SELECT * FROM pool")
        data = cur.fetchall()
        desc = cur.description
        result = [dict(zip([col[0] for col in desc], row)) for row in data]
    return ResponseModel(result).to_json()


# 报销
@app.route('/insurance/claims', methods=['POST'])
def claims():
    wallet_addr = request.form.get('walletAddr')
    pool_addr = request.form.get('poolAddr')
    claims_amount = request.form.get('claimsAmount')
    claims_amount = int(claims_amount)
    cmd = 'cdv decode %s' % wallet_addr
    pay_puzzle_hash= os.popen(cmd).read().strip()

    cmd = 'cdv decode %s' % pool_addr
    my_puzzle_hash= os.popen(cmd).read().strip()

    puzzle_reveal = ''
    with SqlitDB() as cur:
        cur.execute("SELECT puzzle_reveal FROM pool WHERE hash='%s'" % my_puzzle_hash)
        data = cur.fetchall()
        if len(data[0]) > 0:
            puzzle_reveal = data[0][0]
    cmd = 'cdv rpc coinrecords --by puzhash %s -s 584873' % my_puzzle_hash
    res = os.popen(cmd).read().strip()
    res = json.loads(res)
    total_amount = 0
    coin_spends = []
    for i in range(0, len(res)):
        if not res[i]['spent']:
            total_amount += res[i]['coin']['amount']
            print('total_amount:',total_amount)
            parent_coin_info =res[i]['coin']['parent_coin_info'][2:]
            puzzle_hash = res[i]['coin']['puzzle_hash'][2:]
            amount = res[i]['coin']['amount']
            deta = total_amount-claims_amount
            cmd = 'opc "(0x%s 0x%s %d %d %d)"' % (pay_puzzle_hash,my_puzzle_hash, (total_amount-100) if deta > 0 else 0, 1 if deta > 0 else 0, 1 if deta > 0 else 0)
            solution = os.popen(cmd).read().strip()
            coin_info =  {"coin": {"parent_coin_info":parent_coin_info, "puzzle_hash": puzzle_hash, "amount": amount}, "puzzle_reveal": puzzle_reveal, "solution": solution}
            coin_spends.append(coin_info)
            if total_amount > claims_amount:
                break;#如果当前够报销，不再继续打包

    claims_data = {"coin_spends":coin_spends,  "aggregated_signature": "0xc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"}
    path = os.path.join(os.path.dirname(__file__), 'claims.json')
    with open(path, 'w') as f:
        f.write(json.dumps(claims_data))
    cmd = "cdv rpc pushtx %s " % path
    res = os.popen(cmd).read().strip()
    if not res:
        return ResponseModel(message='claims failed', code=201).to_json()
    return ResponseModel(data=json.loads(res)).to_json()


@app.route('/convertHashToAddress', methods=['GET'])
def convert():
    # "b5ed7593aab65d28a853347e78398d556f3a4a1913d73e546477cf4466b020c9"
    hash = request.args.get('hash')
    cmd = 'cdv encode %s --prefix txch' % hash
    address = os.popen(cmd).read().strip()
    if not address:
        return ResponseModel(message=hash, code=201).to_json()
    return ResponseModel(data=address).to_json()


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=7777)
