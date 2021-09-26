import 'dart:math';
import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/pages/backup_hint.dart';
import 'package:wallet/pages/backup_wallet.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ImportPrivateKeySetPwdPage extends StatefulWidget {
  @override
  _ImportPrivateKeySetPwdPageState createState() =>
      _ImportPrivateKeySetPwdPageState();
}

class _ImportPrivateKeySetPwdPageState
    extends State<ImportPrivateKeySetPwdPage> {
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  bool isHidePwd = true;
  List<String> addressList = [
    'TXMsg7FpZAqo7Dq87h1F3B7ESrnwsT32CN',
    'TVvkXGgJraFJeAt1wDV65d8Vo1CogHdbgt',
    'TPUAb4TTbQ4CBjBk1RdKBSiUrmAetEdpRC',
  ];

  @override
  Widget build(BuildContext context) {
    var type = Get.arguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyWidget.myAppBar(type == 1 ? '助记词导入' : '私钥导入'),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyWidget.text(
                '设置密码',
                fontSize: 18,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17),
                child: MyWidget.text(
                  '密码用于加密保护私钥、转账等，所以强度非常重要',
                  color: Colors.black38,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 22),
                child: MyWidget.text(
                  'CHAI不存储密码，也无法帮你您找回，请务必牢记',
                  color: ColorUtil.setColor('#FFA800'),
                ),
              ),
              _customTextField(_controller, hint: '输入密码'),
              SizedBox(height: 13),
              _customTextField(_controller2, hint: '确认密码'),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 12),
                child: MyWidget.text('为保护您的资产，密码应包括：\n大写字母，小写字母，数字，至少8位字符'),
              ),
              Spacer(),
              Container(
                child: MyWidget.gradientButton('确认', onPressed: () {
                  Person person;
                  var address = addressList[Random().nextInt(3)];
                  var privateKey =
                      '0bcd697fbfef35679ad5g6a0f701607c4adba82f7bceffd2e5127088d2b4b238';
                  var mnemonic =
                      'lecture cinnamon owner seminar hover zero humble supply satoshi arm galaxy love';
                  var model = Get.find<PersonModel>();
                  List<Person> personList = SpUtil.getObjList<Person>(
                      'person', (v) => Person.fromJson(v),
                      defValue: <Person>[]);
                  person = Person(
                      name: model.name,
                      pwd: _controller.text,
                      mnemonic: mnemonic,
                      address: address,
                      privateKey: privateKey);
                  personList.add(person);
                  SpUtil.putObjectList('person', personList);

                  Get.offAllNamed(Routes.TabNavigatorPage);
                }),
              )
            ],
          ),
        ));
  }

  //自定义输入框
  Widget _customTextField(TextEditingController controller, {String hint}) {
    return Container(
      height: 45,
      color: ColorUtil.setColor('#EEEEEE'),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: FocusNode(),
              controller: _controller,
              obscureText: isHidePwd,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(fontSize: 14),
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: isHidePwd
                ? Image.asset('images/img／biyan.png', width: 18)
                : Image.asset('images/img／zhengyan.png', width: 18),
            onPressed: () {
              setState(() {
                isHidePwd = !isHidePwd;
              });
            },
          ),
        ],
      ),
    );
  }
}
