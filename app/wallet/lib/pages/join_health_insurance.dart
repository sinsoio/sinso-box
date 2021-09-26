import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class JoinHealthInsurancePage extends StatefulWidget {
  @override
  _JoinHealthInsurancePageState createState() =>
      _JoinHealthInsurancePageState();
}

class _JoinHealthInsurancePageState extends State<JoinHealthInsurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('加入医保'),
      body: ListView.separated(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.GuaranteePlanPage);
              },
              child: _widget(),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemCount: 2),
    );
  }

  Widget _widget() {
    return Container(
      height: 161,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyWidget.myListTile(
              IconText(
                label: 'sinso56887987',
                icon: Image.asset(
                  'images/img／jilu-zs.png',
                  height: 15,
                ),
              ),
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
        ],
      ),
    );
  }
}
