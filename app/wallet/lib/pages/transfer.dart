import 'package:flutter/material.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

//转账
class TransferPage extends StatefulWidget {
  TransferPage({Key key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('转账'),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
            child: MyWidget.text('接收账户'),
          ),
          MyWidget.textFormField(
            color: Colors.white,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset('images/img-saoma.png', width: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
            child: MyWidget.text('选择通证'),
          ),
          MyWidget.textFormField(
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
            child: MyWidget.text('转账金额'),
          ),
          MyWidget.textFormField(
            contentPadding: EdgeInsets.all(15),
            color: Colors.white,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 15),
              child: MyWidget.text('全部', color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 15),
            child: MyWidget.text('钱包余额: 250', color: Colors.blue),
          ),
          ListTile(
            title: MyWidget.text('手续费'),
            trailing: MyWidget.text('0.0005XCH', color: Colors.blue),
            tileColor: Colors.white,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37, vertical: 22),
            child: MyWidget.gradientButton('确定', onPressed: () {}),
          )
        ],
      ),
    );
  }
}
