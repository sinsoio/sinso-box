class Person {
  String name;
  String pwd;
  String mnemonic;
  String address;
  String privateKey;

  Person({this.name, this.pwd, this.mnemonic, this.address, this.privateKey});

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pwd = json['pwd'];
    mnemonic = json['mnemonic'];
    address = json['address'];
    privateKey = json['privateKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pwd'] = this.pwd;
    data['mnemonic'] = this.mnemonic;
    data['address'] = this.address;
    data['privateKey'] = this.privateKey;
    return data;
  }
}
