import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/pages/import_private_key.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ImportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('导入钱包'),
      body: Column(
        children: [
          ListTile(
            tileColor: Colors.white,
            title: MyWidget.text('助记词导入', fontSize: 15),
            subtitle: MyWidget.text(
              '通过输入助记词导入',
              fontSize: 12,
              color: ColorUtil.setColor('#999BA5'),
            ),
            trailing: Image.asset('images/img／next.png', width: 8.5),
            onTap: () {
              Get.toNamed(Routes.ImportPrivateKeyPage,arguments: 1);
            },
          ),
          Divider(height: 0.5),
          ListTile(
            tileColor: Colors.white,
            title: MyWidget.text('私钥导入', fontSize: 15),
            subtitle: MyWidget.text(
              '通过输入铭文私钥导入',
              fontSize: 12,
              color: ColorUtil.setColor('#999BA5'),
            ),
            trailing: Image.asset('images/img／next.png', width: 8.5),
            onTap: () {
              Get.toNamed(Routes.ImportPrivateKeyPage,arguments: 2);
            },
          ),
        ],
      ),
    );
  }
}
