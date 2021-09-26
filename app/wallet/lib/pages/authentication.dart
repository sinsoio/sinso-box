import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

//身份验证
class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('身份验证'),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('投保人手机'),
          ),
          MyWidget.textFormField(color: Colors.white),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 14, 14, 11),
            child: MyWidget.text('验证码'),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 15),
            child: MyWidget.textFormField(
                color: Colors.white,
                suffixIcon: MyWidget.text('获取', color: Colors.blue)),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 37, right: 37, bottom: 22),
            child: MyWidget.gradientButton('确定', onPressed: () {
              Get.toNamed(Routes.InsuredTransferPage);
            }),
          ),
        ],
      ),
    );
  }
}
