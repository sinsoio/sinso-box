import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ExportPrivateKeyPage extends StatelessWidget {
  const ExportPrivateKeyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('导出私钥'),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MyWidget.text('输入私钥', fontSize: 18),
            // MyWidget.text('在下方输入矿中输入', color: Colors.black38),
            Container(
              height: 60,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: ColorUtil.setColor('#EEEEEE'),
              child: MyWidget.text(
                '安全警告：私钥导出后请妥善保管，不要泄露，一旦泄露，可能导致资产损失',
                fontSize: 13,
                color: ColorUtil.setColor('#FFA800'),
              ),
            ),

            Container(
              height: 200,
              margin: EdgeInsets.only(top: 12),
              color: ColorUtil.setColor('#EEEEEE'),
              child: Stack(
                children: [
                  SizedBox(
                    height: 200,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      controller: _controller,
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 15,
                    child: InkWell(
                      child: MyWidget.text(
                        '复制',
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
            
            MyWidget.gradientButton('下一步', onPressed: () {
              Get.toNamed(Routes.ImportPrivateKeySetNamePage);
            }),
          ],
        ),
      ),
    );
  }
}
