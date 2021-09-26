import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class CreateWalletSetNamePage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('创建钱包'),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(37, 29, 37, 23),
        child: Column(
          children: [
            MyWidget.text(
              '设置名称',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            Padding(
              padding: EdgeInsets.only(top: 17, bottom: 21),
              child: MyWidget.text('钱包名称用于帮助您区分不同的钱包账户'),
            ),
            Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorUtil.setColor('#EEEEEE'),
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '1-10个字符',
                    hintStyle: TextStyle(fontSize: 14),
                    isCollapsed: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            Spacer(),
            MyWidget.gradientButton('下一步', onPressed: () {
              print('已设置名称：-------------> ${_controller.text}');
              Get.find<PersonModel>().setName(_controller.text);
              Get.toNamed(Routes.CreateWalletSetPwdPage);
            }),
          ],
        ),
      ),
    );
  }
}
