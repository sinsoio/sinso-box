import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/pages/backup_wallet.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

//备份提示
class BackupHintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('备份钱包'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 54),
          Image.asset(
            'images/img-jietu.png',
            width: 52,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: MyWidget.text(
              '请勿截图',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          MyWidget.text('如果有人获取了你的助记词将直接获取你的资产'),
          SizedBox(height: 66),
          MyWidget.text(
            '请抄下助记词并存放在安全的地方!',
            color: ColorUtil.setColor('#FFA800'),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.fromLTRB(37, 0, 37, 23),
            child: MyWidget.gradientButton('我知道了', onPressed: () {
              Get.toNamed(Routes.BackupWalletPage);
            }),
          )
        ],
      ),
    );
  }
}
