import 'package:flutter/material.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/my_widget.dart';

class WalletItem extends StatelessWidget {
  final Person person;
  const WalletItem(this.person, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          ColorUtil.setColor('#8C69FF'),
          ColorUtil.setColor('#453CFF'),
        ]), // 渐变色
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 12,
            child: Image.asset('images/img／zhuangshi.png'),
            width: 85,
          ),
          Positioned(
            top: 16,
            left: 12,
            child: MyWidget.text(
              person.name,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 47,
            left: 12,
            child: MyWidget.text('地址:', color: Colors.white),
          ),
          Positioned(
            top: 49,
            left: 50,
            child: SizedBox(
              width: 234,
              child: MyWidget.text(
                person.address,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
