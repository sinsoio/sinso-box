import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class CreateWalletSetPwdPage extends StatefulWidget {
  @override
  _CreateWalletSetPwdPageState createState() => _CreateWalletSetPwdPageState();
}

class _CreateWalletSetPwdPageState extends State<CreateWalletSetPwdPage> {
  var _pwdController = TextEditingController();
  var _pwdController2 = TextEditingController();
  bool isHidePwd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('创建钱包'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 29),
            child: MyWidget.text(
              '设置密码',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17),
            child: MyWidget.text('密码用于加密保护私钥、转账等，所以强度非常重要'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 22),
            child: MyWidget.text('CHAI不存储密码，也无法帮你您找回，请务必牢记'),
          ),
          _customTextField(_pwdController, '输入密码'),
          SizedBox(height: 13),
          _customTextField(_pwdController2, '确认密码'),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 12, left: 39),
            child: MyWidget.text('为保护您的资产，密码应包括：\n大写字母，小写字母，数字，至少8位字符'),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 37, vertical: 23),
            child: MyWidget.gradientButton('创建钱包', onPressed: () {
              if (_pwdController.text != _pwdController2.text) {
                Get.snackbar('温馨提示', '两次密码输入不一致');
                return;
              }
              print('已设置密码------------------->${_pwdController.text}');
              Get.find<PersonModel>().setPwd(_pwdController.text);
              Get.toNamed(Routes.BackupHintPage);
            }),
          )
        ],
      ),
    );
  }

  //自定义输入框
  Widget _customTextField(TextEditingController controller, String hintText) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 37),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorUtil.setColor('#EEEEEE'),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: FocusNode(),
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14),
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
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
