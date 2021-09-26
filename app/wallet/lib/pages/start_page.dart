import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/widget/my_widget.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/img-bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 69,
            child: Image.asset(
              'images/img-bg-yuan.png',
              width: 306,
              height: 260.5,
            ),
          ),
          Positioned(
            top: 152,
            child: Image.asset(
              'images/img／chia.png',
              width: 111,
              height: 42.5,
            ),
          ),
          Positioned(
            top: 221,
            child: MyWidget.text(
              '欢迎来到SINSO-BOX',
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(37, 0, 37, 147),
            child: MyWidget.gradientButton(
              '创建钱包',
              onPressed: () {
                Get.toNamed(Routes.CreateWalletSetNamePage);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(37, 0, 37, 84),
            child: MyWidget.gradientButton(
              '导入钱包',
              onPressed: () {
                Get.toNamed(Routes.ImportMnemonicPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
