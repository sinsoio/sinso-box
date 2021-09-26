import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';
import 'package:wallet/widget/wallet_item.dart';

class SwitchWalletPage extends StatefulWidget {
  SwitchWalletPage({Key key}) : super(key: key);

  @override
  _SwitchWalletPageState createState() => _SwitchWalletPageState();
}

class _SwitchWalletPageState extends State<SwitchWalletPage> {
  List<Person> list =
      SpUtil.getObjList<Person>('person', (v) => Person.fromJson(v));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('切换钱包'),
      body: ListView.separated(
        padding: EdgeInsets.all(15),
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _addWallet();
          } else {
            return GestureDetector(
              onTap: (){
                Get.back(result: list[index-1]);
              },
              child: WalletItem(list[index - 1]),
            );
          }
        },
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Container(height: 15);
        },
      ),
    );
  }

  //顶部添加按钮
  Widget _addWallet() {
    return InkWell(
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            ColorUtil.setColor('#8C69FF'),
            ColorUtil.setColor('#453CFF'),
          ]), // 渐变色
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconText(
          label: '添加钱包',
          icon: Image.asset(
            'images/img／add.png',
            height: 15,
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 4),
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () {
        Get.toNamed(Routes.CreateWalletSetNamePage);
      },
    );
  }
}
