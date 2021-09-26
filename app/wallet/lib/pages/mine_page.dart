import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/widget/my_widget.dart';
import 'package:wallet/widget/icon_text.dart';

import '../routes.dart';

class MinePage extends StatelessWidget {
  MinePage({Key key}) : super(key: key);

  final List<AccountItemInfo> list = [
    AccountItemInfo('images/img／jiaoyijilu.png', '交易记录'),
    AccountItemInfo('images/img／guanyuwomen.png', '关于我们'),
    AccountItemInfo('images/ing／yuyan.png', '语言'),
    AccountItemInfo('images/img-bank.png', 'sinso医保'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
          padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
          itemBuilder: (context, index) {
            if (index == 0) {
              return MyWidget.text('我的',
                  fontSize: 20, fontWeight: FontWeight.bold);
            } else {
              return _item(index);
            }
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 15);
          },
          itemCount: list.length + 1),
    );
  }

  Widget _item(index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        child: Container(
          height: 57,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                label: list[index - 1].label,
                icon: Image.asset(list[index - 1].icon, height: 35),
              ),
              Image.asset('images/img／next.png', height: 14),
            ],
          ),
        ),
        onTap: () {
          switch (list[index - 1].label) {
            case '交易记录':
              Get.toNamed(Routes.TransferRecordPage);
              break;
            case '关于我们':
              Get.toNamed(Routes.AboutUsPage);
              break;
            case '导出keystore':
              Get.toNamed(Routes.TransferPage);
              break;
              case 'sinso医保':
              Get.toNamed(Routes.SinSoMedicalInsurancePage);
              break;
            default:
          }
        },
      ),
    );
  }
}
