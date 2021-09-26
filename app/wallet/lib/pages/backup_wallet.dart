import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class BackupWalletPage extends StatefulWidget {
  @override
  _BackupWalletPageState createState() => _BackupWalletPageState();
}

class _BackupWalletPageState extends State<BackupWalletPage> {
  List<String> _list = [
    'lecture',
    'cinnamon',
    'owner',
    'seminar',
    'hover',
    'zero',
    'humble',
    'supply',
    'satoshi',
    'arm',
    'galaxy',
    'love',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('备份钱包'),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 23),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18),
              child: MyWidget.text('助记词用于恢复钱包及重置钱包密码，请准确无误抄写助记词，并存放在安全的地方'),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: _list.map((e) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorUtil.setColor('#EEEEEE'),
                      borderRadius: BorderRadius.circular(5)),
                  child: MyWidget.text(e),
                );
              }).toList(),
            ),
            Container(
              width: double.infinity,
              height: 126,
              margin: EdgeInsets.only(top: 25),
              padding: EdgeInsets.only(top: 17, left: 10),
              color: ColorUtil.setColor('#F1F1F1'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidget.text('切记:',
                      fontSize: 13, color: ColorUtil.setColor('#FFA800')),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: MyWidget.text(
                      '1. 请勿将助记词透露给任何人\n2. 助记词一旦丢失，资产无法恢复\n3. 请勿通过截屏，网络传输的方式进行备份保存\n4. 遇到任何情况，请不要轻易卸载钱包APP',
                      fontSize: 12,
                      color: ColorUtil.setColor('#FFA800'),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            MyWidget.strokeButton('复制助记词', onPressed: () {
              var mnemonic = '';
              for (String i in _list) {
                mnemonic += i + ' ';
              }
              Clipboard.setData(ClipboardData(text: mnemonic));
              Get.snackbar(
                '温馨提示~',
                '助记词复制成功！',
                colorText: Colors.white,
                backgroundColor: Colors.blue,
              );
              print('已设置助记词----------------->$mnemonic');
              Get.find<PersonModel>().setMnemonic(mnemonic);
            }),
            SizedBox(height: 19),
            MyWidget.gradientButton('备份完成，进行验证', onPressed: () {
              var mnemonic = '';
              for (String i in _list) {
                mnemonic += i + ' ';
              }
              print('已设置助记词----------------->$mnemonic');
              Get.find<PersonModel>().setMnemonic(mnemonic);
              Get.toNamed(Routes.VerifyMnemonicPage);
            }),
          ],
        ),
      ),
    );
  }
}
