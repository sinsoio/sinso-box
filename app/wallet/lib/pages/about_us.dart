import 'package:flutter/material.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('关于我们'),
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: MyWidget.myListTile(
              MyWidget.text('软件版本信息'),
              IconText(
                  label: '检查更新',
                  direction: IconDirection.right,
                  icon: Image.asset(
                    'images/img／next.png',
                    height: 14,
                  )),
            ),
          ),
          Divider(
            height: 0.5,
          ),
          Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            child: MyWidget.text('客服联系方式：4002365458'),
          ),
          Container(
            width: 164,
            height: 27,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 38),
            color: Colors.grey,
            child: MyWidget.text('您的版本已经是最新的', color: Colors.white),
          ),
        ],
      ),
    );
  }
}
