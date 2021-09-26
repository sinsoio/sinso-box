import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/account_item.dart';
import 'package:wallet/widget/dialog_create_or_import.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class WalletAccountPage extends StatefulWidget {
  WalletAccountPage({Key key}) : super(key: key);

  @override
  _WalletAccountPageState createState() => _WalletAccountPageState();
}

class _WalletAccountPageState extends State<WalletAccountPage> {
  List<AccountItemInfo> _list = [
    AccountItemInfo('images/img／xch.png', 'XCH', number: 25.56),
    AccountItemInfo('images/img／sinso.png', 'SINSO', number: 48.5656786),
  ];

  List<Person> list;

  Person person;

  @override
  void initState() {
    super.initState();
    list = SpUtil.getObjList<Person>('person', (v) => Person.fromJson(v));
    setState(() {
      person = list.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //顶部名称
        Container(
          padding: EdgeInsets.fromLTRB(15, 45, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                label: person.name,
                icon: Image.asset('images/img／next.png', height: 16),
                direction: IconDirection.right,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                onPress: switchWallet,
              ),
              IconText(
                label: '添加钱包',
                icon: Image.asset('images/img／add.png', height: 15),
                padding: EdgeInsets.only(left: 4),
                onPress: showDialog,
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        Stack(
          children: [
            Image.asset('images/img／zichan-bg.png'),
            Container(
              height: 184,
              padding: EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(top: 10, bottom: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyWidget.text('我的资产',
                            fontSize: 16, color: Colors.white),
                        IconText(
                          label: '详情',
                          textStyle: TextStyle(color: Colors.white),
                          icon: Image.asset(
                            'images/img／next.png',
                            height: 11,
                            color: Colors.white,
                          ),
                          direction: IconDirection.right,
                          padding: EdgeInsets.only(right: 4),
                          onPress: goToDetails,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 19),
                    child: MyWidget.text(
                      '580.00',
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyWidget.myButton(
                          '转账',
                          width: 107,
                          height: 30,
                          onPressed: () {
                            Get.toNamed(Routes.TransferPage);
                          },
                          backgroundColor: ColorUtil.setColor('#86A2FF'),
                          primary: Colors.white,
                          fontSize: 12,
                        ),
                        MyWidget.myButton(
                          '收款',
                          width: 107,
                          height: 30,
                          onPressed: () {
                            Get.toNamed(Routes.ReceivePaymentPage);
                          },
                          backgroundColor: ColorUtil.setColor('#86A2FF'),
                          primary: Colors.white,
                          fontSize: 12,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //我的资产

        //资产
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyWidget.text('资产', fontSize: 18, fontWeight: FontWeight.bold),
              MyWidget.myButton(
                '添加',
                width: 56,
                height: 23,
                onPressed: () {},
                backgroundColor: ColorUtil.setColor('#0084FF'),
                fontSize: 11,
                primary: Colors.white,
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(15, 11, 15, 13),
          child: Divider(
            height: 0.5,
            color: ColorUtil.setColor('#E9E9E9'),
          ),
        ),

        Column(
          children: _list.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: AccountItem(e),
            );
          }).toList(),
        ),
      ],
    );
  }

  //点击弹出对话框
  showDialog() async {
    int status = await Get.bottomSheet(DialogCreateOrImport(),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ));
    switch (status) {
      case 1:
        Get.toNamed(Routes.CreateWalletSetNamePage);
        break;
      case 2:
        Get.toNamed(Routes.ImportMnemonicPage);
        break;
      default:
        break;
    }
  }

  //点击跳转到切换钱包
  switchWallet() async {
    var data = await Get.toNamed(Routes.SwitchWalletPage);
    if (ObjectUtil.isNotEmpty(data)) {
      setState(() {
        this.person = data as Person;
      });
    }
  }

  //点击跳转到钱包详情
  goToDetails() {
    Get.toNamed(Routes.WalletDetailsPage, arguments: person);
  }
}
