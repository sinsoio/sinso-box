import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:wallet/entity/item_info.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/account_item.dart';
import 'package:wallet/widget/my_widget.dart';

//选择通证
class SelectPassPage extends StatefulWidget {
  @override
  _SelectPassPageState createState() => _SelectPassPageState();
}

class _SelectPassPageState extends State<SelectPassPage> {
  List<AccountItemInfo> _list = [
    AccountItemInfo('images/img／xch.png', 'XCH', number: 25.56),
    AccountItemInfo('images/img／sinso.png', 'SINSO', number: 48.5656786),
  ];

  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.setBackgroundColor(),
      appBar: MyWidget.myAppBar('选择通证'),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _search();
          } else {
            return AccountItem(_list[index - 1]);
          }
        },
        separatorBuilder: (context, index) {
          return Container(height: 10);
        },
        itemCount: _list.length + 1,
      ),
    );
  }

  Widget _search() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyWidget.text('搜索代币/合约'),
            Icon(Icons.search),
          ],
        ),
      ),
      onTap: () => showSearch(
        context: context,
        delegate: SearchPage<AccountItemInfo>(
          onQueryUpdate: (s) => print(s),
          items: _list,
          searchLabel: 'Search ',
          suggestion: Center(
            child: Text('Filter people by name, surname or age'),
          ),
          failure: Center(
            child: Text('No person found :('),
          ),
          filter: (info) => [
            info.label,
          ],
          builder: (info) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: AccountItem(info),
          ),
        ),
      ),
    );
  }
}
