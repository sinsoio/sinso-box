import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class SinSoMedicalInsurancePage extends StatefulWidget {
  @override
  _SinSoMedicalInsurancePageState createState() =>
      _SinSoMedicalInsurancePageState();
}

class _SinSoMedicalInsurancePageState extends State<SinSoMedicalInsurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('sinso医保'),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 11),
            child: MyWidget.text('投保人手机'),
          ),
          Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.textFormField(
              color: Colors.white,
              // contentPadding: EdgeInsets.symmetric(horizontal: 15,v),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconText(
                    label: '国家选择',
                    textStyle: TextStyle(fontSize: 16, color: Colors.black38),
                    icon: Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.black38),
                    padding: EdgeInsets.only(left: 3),
                    direction: IconDirection.right,
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    margin: EdgeInsets.only(left: 10, right: 20),
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 11),
            child: MyWidget.text('验证码'),
          ),
          Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.textFormField(
              color: Colors.white,
              // contentPadding: EdgeInsets.symmetric(horizontal: 15,v),
              suffixIcon: GestureDetector(
                child: MyWidget.text('获取', color: Colors.blue, fontSize: 16),
                onTap: () {},
              ),
            ),
          ),
          Container(
            height: 35,
            color: Colors.black54,
            margin: EdgeInsets.symmetric(horizontal: 37, vertical: 30),
            alignment: Alignment.center,
            child: MyWidget.text('您暂未开通sinso医保请开通后登录查询！', color: Colors.white),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 37, right: 37, bottom: 22),
            child: MyWidget.gradientButton('确定', onPressed: () {
              var random = Random().nextBool();
              print(random);
              Get.toNamed(Routes.MedicalInsuranceRecordPage, arguments: random);
            }),
          ),
        ],
      ),
    );
  }
}
