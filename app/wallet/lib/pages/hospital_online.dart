import 'package:flutter/material.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class HospotalOnlinePage extends StatelessWidget {
  const HospotalOnlinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('线上医院'),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            IconText(
              label: 'SINSO',
              icon: Image.asset(
                'images/img／app-sinso.png',
                width: 58,
              ),
              direction: IconDirection.top,
            ),
          ],
        ),
      ),
    );
  }
}
