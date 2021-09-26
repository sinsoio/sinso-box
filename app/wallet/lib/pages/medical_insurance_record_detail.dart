import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class MedicalInsuranceRecordDetailPage extends StatelessWidget {
  const MedicalInsuranceRecordDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('sinso医保'),
      body: Stack(
        children: [
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                itemBuilder: (context, index) {
                  return _widget();
                },
                separatorBuilder: (context, index) {
                  return Container(height: 15);
                },
                itemCount: 1),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(horizontal: 37, vertical: 22),
            child: MyWidget.gradientButton('查询报账明细', onPressed: () {
                  Get.toNamed(Routes.ReimburseDetailPage);
            }),
          ),
        ],
      ),
    );
  }

  Widget _widget() {
    return Container(
      height: 192,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyWidget.myListTile(MyWidget.text('2021-05-21'),
              Image.asset('images/img／next.png', height: 13)),
          MyWidget.myListTile(
              MyWidget.text('sinso远程医疗问诊平台',
                  fontSize: 12, color: Colors.black38),
              MyWidget.text('')),
          MyWidget.myListTile(MyWidget.text('就诊金额'),
              MyWidget.text('1 chai', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('报销金额'), MyWidget.text('0.5')),
          MyWidget.myListTile(MyWidget.text('自费金额'),
              MyWidget.text('0 chia', color: Colors.blue)),
          MyWidget.myListTile(MyWidget.text('剩余报销金额'),
              MyWidget.text('4.5 chia', color: Colors.blue)),
        ],
      ),
    );
  }
}
