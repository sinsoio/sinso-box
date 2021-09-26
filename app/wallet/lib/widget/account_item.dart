import 'package:flutter/material.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class AccountItem extends StatelessWidget {
  
  final AccountItemInfo info;

  const AccountItem(this.info, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                label: info.label,
                icon: Image.asset(info.icon, width: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
              MyWidget.text('${info.number}', fontSize: 18,color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}
