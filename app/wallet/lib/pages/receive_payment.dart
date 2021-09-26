import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class ReceivePaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('收款'),
      body: Container(
        height: 390,
        margin: EdgeInsets.fromLTRB(42.5, 52.5, 42.5, 0),
        child: Column(
          children: [
            Container(
              height: 58,
              alignment: Alignment.center,
              child: MyWidget.text('扫一扫向我支付', fontSize: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 332,
              decoration: BoxDecoration(
                color: ColorUtil.setColor('#3E82FF'),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
              ),
              child: Column(
                children: [
                  Container(
                    // padding: EdgeInsets.all(12.5),
                    margin: EdgeInsets.only(top: 36.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    child: QrImage(data: '', size: 150),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(35.5,38,39.5,20),
                    child: MyWidget.text('xch18q8hyw3t2vsfhjkadshkjh4qx4mzwxdsar2f8h',color: Colors.white),
                  ),

                  MyWidget.text('复制',color: Colors.white)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
