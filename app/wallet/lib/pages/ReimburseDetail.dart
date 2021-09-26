import 'package:flutter/material.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/widget/my_widget.dart';

class ReimburseDetailPage extends StatelessWidget {
  final List<AccountItemInfo> list = [
    AccountItemInfo('保障时间', '365天'),
    AccountItemInfo('就诊平台', 'sinso远程就诊平台'),
    AccountItemInfo('就诊方式', '线上就诊'),
    AccountItemInfo('就诊医生', '老罗'),
    AccountItemInfo('就诊结果', '新冠肺炎'),
    AccountItemInfo('诊断费用', '0.5 chia'),
    AccountItemInfo('报销费用', '0.5 chia'),
    AccountItemInfo('自费费用', '0 chia'),
    AccountItemInfo('诊疗ID', 'sinso564654'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('sinso医保'),
      body: ListView.separated(

          padding: EdgeInsets.symmetric(horizontal: 15),
          itemBuilder: (context, index) {
            return widget(list[index].icon, list[index].label);
          },
          separatorBuilder: (context, index) {
            return Divider(height: 1,color: Colors.black26);
          },
          itemCount: list.length),
    );
  }

  Widget widget(label, content) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: MyWidget.myListTile(MyWidget.text(label), MyWidget.text(content)),
    );
  }
}
