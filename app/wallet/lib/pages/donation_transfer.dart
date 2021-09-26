
import 'package:flutter/material.dart';
import 'package:wallet/widget/my_widget.dart';

class DonationTransferPage extends StatelessWidget {
  const DonationTransferPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidget.myAppBar('转账'),
    );
  }
}