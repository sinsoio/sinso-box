import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class CooperativeHospitalPage extends StatelessWidget {
  const CooperativeHospitalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('合作医院'),
      body: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _widget('线上医院', 'images/img／xianshang-bg.png',
                  'images/img-xianshang.png'),
              _widget('线下医院', 'images/img／xianxia-bg.png',
                  'images/inf／xianxia.png'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _widget(label, bg, icon) {
    return InkWell(
      onTap: () {
        switch (label) {
          case '线上医院':
            Get.toNamed(Routes.HospotalOnlinePage);
            break;
          case '线下医院':
            Get.toNamed(Routes.HospitalOfflinePage);
            break;
          default:
        }
      },
      child: Container(
        width: 130,
        height: 135,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg),
            fit: BoxFit.cover,
          ),
        ),
        child: IconText(
          label: label,
          icon: Image.asset(
            icon,
            width: 31.5,
          ),
          textStyle: TextStyle(color: Colors.white),
          direction: IconDirection.top,
        ),
      ),
    );
  }
}
