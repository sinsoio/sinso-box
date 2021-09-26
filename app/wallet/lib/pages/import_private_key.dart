import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ImportPrivateKeyPage extends StatelessWidget {
  ImportPrivateKeyPage({Key key}) : super(key: key);

  final model = Get.find<PersonModel>();

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    var type = Get.arguments;
    var controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar(type == 1 ? '助记词导入' : '私钥导入'),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyWidget.text(type == 1 ? '输入助记词' : '输入私钥', fontSize: 18),
            MyWidget.text('在下方输入矿中输入', color: Colors.black38),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 12),
              color: ColorUtil.setColor('#EEEEEE'),
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: _controller,
                maxLines: 6,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: type == 2 ? '助记词用空格隔开' : '',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            Spacer(),
            MyWidget.gradientButton('下一步', onPressed: () {
              if (type == 1) {
                model.setMnemonic(controller.text);
              } else {
                model.setPrivateKey(controller.text);
              }
              Get.toNamed(Routes.ImportPrivateKeySetNamePage, arguments: type);
            }),
          ],
        ),
      ),
    );
  }
}
