import 'package:get/get.dart';

class PersonModel extends GetxController {
  String name = '';
  String pwd = '';
  String mnemonic = '';
  String privateKey = '';

  setName(String name) {
    this.name = name;
    update();
  }

  setPwd(String pwd) {
    this.pwd = pwd;
    update();
  }

  setMnemonic(String mnemonic) {
    this.mnemonic = mnemonic;
    update();
  }

  setPrivateKey(String privateKey) {
    this.privateKey = privateKey;
    update();
  }
}
