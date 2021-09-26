import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class WalletDetailsPage extends StatelessWidget {
  final List<AccountItemInfo> _list = [
    AccountItemInfo('images/img／xhujicidc.png', '导出助记词'),
    AccountItemInfo('images/img／siyaodc.png', '导出私钥'),
    AccountItemInfo('images/img／keystore.png', '导出keystore'),
  ];

  WalletDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Person person = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('钱包详情'),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _widget(person);
            } else {
              return _item(index);
            }
          },
          separatorBuilder: (context, index) {
            return Container(height: 10);
          },
          itemCount: 4),
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
                label: _list[index - 1].label,
                icon: Image.asset(_list[index - 1].icon, height: 35),
              ),
              Image.asset('images/img／next.png', height: 14),
            ],
          ),
        ),
        onTap: () {
          switch (_list[index - 1].label) {
            case '导出助记词':
              Get.toNamed(Routes.BackupWalletPage);
              break;
            case '导出私钥':
              Get.toNamed(Routes.ExportPrivateKeyPage);
              break;
            case '导出keystore':
              Get.toNamed(Routes.TransferPage);
              break;
            default:
          }
        },
      ),
    );
  }

  Widget _widget(Person person) {
    return Container(
      height: 130,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorUtil.setColor('#8C69FF'),
          ColorUtil.setColor('#453CFF'),
        ]), // 渐变色
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 24,
            left: 12,
            child: Image.asset(
              'images/img／xch-big.png',
              width: 65,
              height: 65,
            ),
          ),
          Positioned(
            top: 29,
            left: 85,
            child: MyWidget.text(
              person.name,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 59,
            left: 85,
            child: MyWidget.text('地址:', color: Colors.white),
          ),
          Positioned(
            top: 61,
            left: 124,
            child: SizedBox(
              width: 182,
              child: MyWidget.text(
                person.address,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
