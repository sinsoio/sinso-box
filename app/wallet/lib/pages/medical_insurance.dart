import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class MedicalInsurancePage extends StatefulWidget {
  MedicalInsurancePage({Key key}) : super(key: key);

  @override
  _MedicalInsurancePageState createState() => _MedicalInsurancePageState();
}

class _MedicalInsurancePageState extends State<MedicalInsurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorUtil.setBackgroundColor(),
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('SINSO医保',hasBackButton: false),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 33),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 204,
                    height: 204,
                    child: CircularProgressIndicator(
                      value: 0.8,
                      strokeWidth: 21,
                      color: ColorUtil.setColor('#3E82FF'),
                      backgroundColor: ColorUtil.setColor('#E8EFF3'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color: Colors.green,
                    child: Column(
                      children: [
                        MyWidget.text('缴纳总额', fontSize: 16),
                        SizedBox(height: 10),
                        MyWidget.text('2000.00',
                            fontSize: 18, fontWeight: FontWeight.bold),
                        MyWidget.text('chia',
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              margin: EdgeInsets.only(top: 47.5),
              child: Row(
                children: [
                  _middelCard('当前余额', '580.00'),
                  SizedBox(width: 15),
                  _middelCard('累计报销', '2000.00'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 108 / 123,
                crossAxisSpacing: 11,
                children: [
                  _bottomCard(
                      '合作医院', 'images/img／hezuoyy.png', '#3E82FF', '#6888EF'),
                  _bottomCard(
                      '加入医保', 'images/img／jiaruyb.png', '#0EA2E6', '#68E1EF'),
                  _bottomCard(
                      '爱心捐赠', 'images/img／aixinjz.png', '#873EFF', '#B673F4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //余额
  Widget _middelCard(String lable, String amount) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget.text(lable,
                fontSize: 12, color: ColorUtil.setColor('#8B989E')),
            SizedBox(height: 10),
            MyWidget.text(amount, fontSize: 19, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  //底部卡片按钮
  Widget _bottomCard(String label, String icon, String color1, String color2) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              ColorUtil.setColor(color2),
              ColorUtil.setColor(color1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(icon, width: 61),
            MyWidget.text(label, color: Colors.white),
          ],
        ),
      ),
      onTap: () {
        onPressed(label);
      },
    );
  }

  //底部点击事件
  onPressed(String label) {
    switch (label) {
      case '合作医院':
        Get.toNamed(Routes.CooperativeHospitalPage);
        break;
      case '加入医保':
        Get.toNamed(Routes.JoinHealthInsurancePage);
        break;
      case '爱心捐赠':
        Get.toNamed(Routes.LoveDonationPage);
        break;

      default:
    }
  }
}
