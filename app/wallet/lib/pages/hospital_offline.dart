import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class HospitalOfflinePage extends StatelessWidget {
  const HospitalOfflinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('线下医院'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 13),
                    margin: EdgeInsets.only(right: 15),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: IconText(
                      label: '输入医院名称',
                      textStyle: TextStyle(color: Colors.black38),
                      icon: Icon(
                        Icons.search_rounded,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                MyWidget.text('搜索', color: Colors.blue),
              ],
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: MyWidget.myListTile(
                    IconText(
                        label: 'Alkhidmat Hosptical',
                        icon: Image.asset('images/img／yiyuan-icon.png',
                            width: 33)),
                    Image.asset('images/img／next.png', height: 14)),
              ),
              onTap: () {
                Get.toNamed(Routes.HospitalDetailPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
