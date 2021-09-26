import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class HospitalDetailPage extends StatelessWidget {
  const HospitalDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  'images/img／xiangqing-bg.png',
                  fit: BoxFit.cover,
                  height: 170,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: BackButton(
                        color: Colors.white,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 4),
                      alignment: Alignment.center,
                      child: MyWidget.text(
                        '医院详情',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 23, bottom: 15, left: 15),
            child: MyWidget.text('Alkhidmat Hosptical', fontSize: 20),
          ),
          Container(
            margin: EdgeInsets.only(top: 23, bottom: 15, left: 15),
            child: MyWidget.text(
              'C-11 Side Rd, Phase 2 Gulshan e Hadeed Phase 2 Gulshan-e-Hadeed, Karachi, Karachi City, Sindh,',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 23, bottom: 15, left: 15),
            child: MyWidget.text(
              '+92 41 8723372',
            ),
          ),
          Container(
            height: 10,
            color: ColorUtil.setBackgroundColor(),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: MyWidget.text('介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍'),
          ),
        ],
      ),
    );
  }
}
