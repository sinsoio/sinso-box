import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ImportPrivateKeySetNamePage extends StatelessWidget {
  const ImportPrivateKeySetNamePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    var type = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar(type == 1 ? '助记词导入' : '私钥导入'),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyWidget.text('设置名称', fontSize: 18),
            MyWidget.text('钱包名称用于帮助您区分不同的钱包账户', color: Colors.black38),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 12),
              color: ColorUtil.setColor('#EEEEEE'),
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            Spacer(),
            MyWidget.gradientButton('下一步', onPressed: () {
              Get.find<PersonModel>().setName(_controller.text);
              Get.toNamed(Routes.ImportPrivateKeySetPwdPage, arguments: type);
            }),
          ],
        ),
      ),
    );
  }
}
