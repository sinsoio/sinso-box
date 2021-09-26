import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

//交易记录
class TransferRecordPage extends StatefulWidget {
  TransferRecordPage({Key key}) : super(key: key);

  @override
  _TransferRecordPageState createState() => _TransferRecordPageState();
}

class _TransferRecordPageState extends State<TransferRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('交易记录'),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        itemCount: 4,
        itemBuilder: (contex, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 22, bottom: 18),
              child: MyWidget.myListTile(
                  MyWidget.text(
                    '钱包名称',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  IconText(
                    label: '切换钱包',
                    icon: Image.asset(
                      'images/img／qiehuan.png',
                      width: 15,
                    ),
                    onPress: () {
                      Get.toNamed(Routes.SwitchWalletPage);
                    },
                  )),
            );
          } else {
            return _widget();
          }
        },
        separatorBuilder: (contex, index) {
          if (index == 0) {
            return Container();
          }
          return SizedBox(height: 10);
        },
      ),
    );
  }

  Widget _widget() {
    return Container(
      height: 158,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyWidget.myListTile(
              Image.asset(
                'images/img／jilu-zs.png',
                height: 15,
              ),
              Image.asset(
                'images/img／next.png',
                height: 13,
              )),
          MyWidget.myListTile(
              MyWidget.text('交易ID'), MyWidget.text('xch18w3t2****4mdsar2f8h')),
          MyWidget.myListTile(
              MyWidget.text('区块时间'), MyWidget.text('12-07-2021   19:53:24')),
          MyWidget.myListTile(MyWidget.text('状态'),
              MyWidget.text('成功', color: ColorUtil.setColor('#39CD7B'))),
          MyWidget.myListTile(
              MyWidget.text('amount'),
              MyWidget.text('+125 sinso',
                  color: Colors.blue, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
