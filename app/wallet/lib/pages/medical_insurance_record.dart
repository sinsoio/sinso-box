import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class MedicalInsuranceRecordPage extends StatelessWidget {
  const MedicalInsuranceRecordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var b = Get.arguments;
    print(b);

    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('sinso医保'),
      body: Stack(
        children: [
          ListView.separated(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              itemBuilder: (context, index) {
                return b ? _widget() : _widget2();
              },
              separatorBuilder: (context, index) {
                return Container(height: 15);
              },
              itemCount: 1),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(horizontal: 37, vertical: 22),
            child:
                MyWidget.gradientButton(b ? '查询报账明细' : '继续缴费', onPressed: () {
              Get.toNamed(b
                  ? Routes.MedicalInsuranceRecordDetailPage
                  : Routes.InsuredTransferPage);
            }),
          ),
        ],
      ),
    );
  }

  Widget _widget() {
    return Container(
      height: 292,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyWidget.myListTile(
              MyWidget.text('sinso56887987'),
              Image.asset(
                'images/img／next.png',
                height: 13,
              )),
          MyWidget.myListTile(
              MyWidget.text('sinso健康保障计划', fontSize: 12, color: Colors.black38),
              MyWidget.text('')),
          MyWidget.myListTile(MyWidget.text('存缴金额'),
              MyWidget.text('3 chai', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('保障时间'), MyWidget.text('365天')),
          MyWidget.myListTile(MyWidget.text('保障金额上限'),
              MyWidget.text('8chia', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('已存缴金额'),
              MyWidget.text('1chia', color: Colors.blue)),
          MyWidget.myListTile(
              MyWidget.text('是否达标'), MyWidget.text('达标', color: Colors.green)),
          MyWidget.myListTile(
              MyWidget.text('保障时间'),
              Column(
                children: [
                  MyWidget.text('起2021-05-05'),
                  MyWidget.text('始2022-05-06'),
                ],
              )),
          MyWidget.myListTile(MyWidget.text('剩余报销金额'),
              MyWidget.text('4.5chia', color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _widget2() {
    return Container(
      height: 219,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyWidget.myListTile(
              MyWidget.text('sinso56887987'),
              Image.asset(
                'images/img／next.png',
                height: 13,
              )),
          MyWidget.myListTile(
              MyWidget.text('sinso健康保障计划', fontSize: 12, color: Colors.black38),
              MyWidget.text('')),
          MyWidget.myListTile(MyWidget.text('存缴金额'),
              MyWidget.text('3 chai', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('保障时间'), MyWidget.text('365天')),
          MyWidget.myListTile(MyWidget.text('保障金额上限'),
              MyWidget.text('8chia', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('已存缴金额'),
              MyWidget.text('1chia', color: Colors.blue)),
          MyWidget.myListTile(
              MyWidget.text('是否达标'), MyWidget.text('未达标', color: Colors.red)),
        ],
      ),
    );
  }
}
