
import 'package:flutter/material.dart';
import 'package:wallet/widget/my_widget.dart';

//语言设置
class LanguagePage extends StatefulWidget {
  LanguagePage({Key key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidget.myAppBar('语言'),
      body: ListView(),
    );
  }
}