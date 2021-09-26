import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

//转账
class InsuredTransferPage extends StatefulWidget {
  @override
  _InsuredTransferPageState createState() => _InsuredTransferPageState();
}

class _InsuredTransferPageState extends State<InsuredTransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('转账'),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.myListTile(
                MyWidget.text('钱包名称',
                    fontSize: 18, fontWeight: FontWeight.bold),
                Image.asset(
                  'images/img／next.png',
                  height: 14,
                )),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.text(
              '0bcd697fbfef35679ad5g6a0f701607c4adba82f7bceffd2e5127088d2b4b238',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保账户'),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.text(
              '0bcd697fbfef35679ad5g6a0f701607c4adba82f7bceffd2e5127088d2b4b238',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('通证'),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IconText(
                label: 'XCH',
                icon: Image.asset(
                  'images/img／xch.png',
                  width: 30,
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('转账金额'),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.textFormField(
                color: Colors.white,
                suffixIcon: MyWidget.text('全部', color: Colors.blue)),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15, bottom: 17),
              child: MyWidget.text('钱包余额：255', color: Colors.blue)),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.center,
            color: Colors.white,
            child: MyWidget.myListTile(MyWidget.text('手续费'),
                MyWidget.text('0.0005XCH', color: Colors.blue)),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 37, right: 37, bottom: 22),
            child: MyWidget.gradientButton('确定', onPressed: () {
              Get.offAllNamed(Routes.TabNavigatorPage);
              Get.snackbar(
                '温馨提示',
                '投保成功!',
              );
            }),
          ),
        ],
      ),
    );
  }
}
