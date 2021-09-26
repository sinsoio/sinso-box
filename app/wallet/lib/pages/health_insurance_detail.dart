import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class GuaranteePlanPage extends StatefulWidget {
  @override
  _GuaranteePlanPageState createState() => _GuaranteePlanPageState();
}

class _GuaranteePlanPageState extends State<GuaranteePlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('sinso健康保障计划'),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              child: Image.asset(
                'images/img／jiankang-banner.png',
                height: 194,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 51,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(15, 164.5, 15, 0),
              child: MyWidget.text('精选产品  报账无忧  放心省心',
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                  ColorUtil.setColor('#6CC9FF'),
                  ColorUtil.setColor('#7ADEFF'),
                ]), //
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
              height: 178.5,
              width: double.infinity,
              margin: EdgeInsets.only(left: 15, right: 15, top: 233),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidget.text(
                    '为什么选择sinso健康保障计划',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  MyWidget.text('大病小病都能报'),
                  MyWidget.text('最高40万医疗保障'),
                  MyWidget.text('责任内100%报销各类医疗费用'),
                  MyWidget.text('保费低至0.58/天起'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 25),
              height: 210,
              width: double.infinity,
              margin: EdgeInsets.only(left: 15, right: 15, top: 426),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidget.text(
                    '保险详情',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  MyWidget.text('一般疾病及意外医疗保险金'),
                  MyWidget.text('100种重疾病医疗保险金'),
                  MyWidget.text('100种重疾病津贴保险金'),
                  MyWidget.text('恶性肿瘤特效药'),
                  Divider(height: 1),
                  Row(
                    children: [
                      MyWidget.text("《投保须知》", color: Colors.blue),
                      MyWidget.text("《保险条款》", color: Colors.blue),
                      MyWidget.text("《服务协议》", color: Colors.blue),
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(37, 0, 37, 10),
              child: MyWidget.gradientButton('我要投保', onPressed: () {
                Get.toNamed(Routes.InsuredPage);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
