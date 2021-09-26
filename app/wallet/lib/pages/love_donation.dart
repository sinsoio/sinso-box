import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/widget/my_widget.dart';

class LoveDonationPage extends StatelessWidget {
  const LoveDonationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('爱心捐赠'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              child: Image.asset(
                'images/img／juanzhengtu.png',
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            MyWidget.text(
              '他们说：我觉得，我们与城里的孩子不一样',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            Text(
              '你最喜欢看的书是?\n--“语文书、数学书、英语书。"你觉得你与城里的孩子有什么不一样?\n--“有时候觉得自己的见识特别鄙陋。\n"我们也不禁反思，有什么不一样?\n城乡少年接受教育的环境也许有天壤之别，但在读同一本书的时候，他们应该是完全平等的，他们之间的鸿沟是最应该被跨越的。',
              style: TextStyle(letterSpacing: 2),
            ),
            SizedBox(height: 20),
            Text(
              '同在蓝天下，共阅一本书；聚爱一千城，筑梦一千村，图书架起农村与城市之间的桥梁，开展筹书活动，为乡村学校建立希望工程幕天图书角。同时，通过阅读推广，让城乡少年因阅读而相联，收获“双份的快乐”。',
              style: TextStyle(letterSpacing: 2),
            ),
            SizedBox(height: 20),
            Text(
              '与SINSO一起做公益，帮助乡村学校建立图书角，组织乡村学校开展阅读活动，促进乡村少年阅读成长。',
              style: TextStyle(letterSpacing: 2),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 37),
              child: MyWidget.gradientButton('我要捐助', onPressed: () {
                Get.toNamed(Routes.InsuredTransferPage);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
