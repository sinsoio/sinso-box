import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

//投保
class InsuredPage extends StatefulWidget {
  @override
  _InsuredPageState createState() => _InsuredPageState();
}

class _InsuredPageState extends State<InsuredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('投保'),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人姓名'),
          ),
          MyWidget.textFormField(color: Colors.white),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人所属国家'),
          ),
          Container(
            color: Colors.white,
            height: 50,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.myListTile(
              MyWidget.text('中国'),
              Icon(Icons.keyboard_arrow_down_outlined),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人证件号'),
          ),
          MyWidget.textFormField(color: Colors.white),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人手机'),
          ),
          MyWidget.textFormField(color: Colors.white),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人邮箱'),
          ),
          MyWidget.textFormField(color: Colors.white, hintText: '选填'),
          Row(
            children: [
              Checkbox(value: true, onChanged: (v) {}),
              MyWidget.text('《sinso健康保障计划》', color: Colors.blue)
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 22, left: 37, right: 37),
            child: MyWidget.gradientButton("同意开通投保账户", onPressed: () {
              Get.toNamed(Routes.AuthenticationPage);
            }),
          ),
        ],
      ),
    );
  }
}
