import 'dart:math';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/util/color_util.dart';
import 'package:wallet/widget/icon_text.dart';
import 'package:wallet/widget/my_widget.dart';

class VerifyMnemonicPage extends StatefulWidget {
  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  final model = Get.find<PersonModel>();

  List<String> addressList = [
    'TXMsg7FpZAqo7Dq87h1F3B7ESrnwsT32CN',
    'TVvkXGgJraFJeAt1wDV65d8Vo1CogHdbgt',
    'TPUAb4TTbQ4CBjBk1RdKBSiUrmAetEdpRC',
  ];

  List<String> randomList = [];
  List<String> mnemonicList = [];
  List<String> verifyList = ['', '', '', '', '', '', '', '', '', '', '', ''];

  var index = 0;
  var showError = false;

  @override
  void initState() {
    super.initState();
    mnemonicList =
        model.mnemonic.substring(0, model.mnemonic.length - 1).split(' ');
    initMnemonic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyWidget.myAppBar('验证助记词'),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 23),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 18),
              alignment: Alignment.centerLeft,
              child: MyWidget.text(
                '请根据您抄写的助记词，按顺序选择填充',
                color: ColorUtil.setColor('#676C77'),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 11 / 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: verifyList.map((e) {
                return Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 0.5, color: ColorUtil.setColor('#DADADA')),
                      ),
                      child: MyWidget.text(e),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Visibility(
                        visible: ObjectUtil.isNotEmpty(e),
                        child: GestureDetector(
                          child:
                              Image.asset('images/img-shanchu.png', width: 15),
                          onTap: () {
                            print('456464');
                            setState(() {
                              verifyList[index - 1] = '';
                              index--;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            Visibility(
              visible: showError,
              // visible: true,
              child: Container(
                height: 30,
                color: ColorUtil.setColor('#F1F1F1'),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 14),
                padding: EdgeInsets.only(left: 7),
                child: IconText(
                  label: '助记词填写错误',
                  icon: Image.asset(
                    'images/img-cuowu.png',
                    width: 13,
                  ),
                  textStyle: TextStyle(fontSize: 11, color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 14),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 11 / 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: randomList.map((e) {
                return GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorUtil.setColor('#EEEEEE'),
                        borderRadius: BorderRadius.circular(25)),
                    child: MyWidget.text(e),
                  ),
                  onTap: () {
                    setState(() {
                      verifyList[index] = e;
                      if (index < verifyList.length) {
                        index++;
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Spacer(),
            SizedBox(height: 19),
            MyWidget.gradientButton('备份完成，进行验证', onPressed: () {
              bool b = twoListIsEqual(verifyList, mnemonicList);
              print(verifyList.toList());
              print(mnemonicList.toList());
              if (b) {
                showError = false;
                String address = addressList[Random().nextInt(3)];
                String privateKey =
                    '0bcd697fbfef35679ad5g6a0f701607c4adba82f7bceffd2e5127088d2b4b238';
                Person person = Person(
                  name: model.name,
                  pwd: model.pwd,
                  mnemonic: model.mnemonic,
                  address: address,
                  privateKey: privateKey,
                );
                List<Person> personList = SpUtil.getObjList<Person>(
                    'person', (v) => Person.fromJson(v),
                    defValue: <Person>[]);
                personList.add(person);
                SpUtil.putObjectList('person', personList);
                Get.snackbar('温馨提示~', '助记词验证成功！');
                Get.offAllNamed(Routes.TabNavigatorPage);
              } else {
                Get.snackbar('警告~', '助记词验证错误，请重新验证！');
                setState(() {
                  showError = true;
                });
              }
            }),
          ],
        ),
      ),
    );
  }

  initMnemonic() async {
    int count = 0;
    do {
      var index = Random().nextInt(12);
      if (randomList.contains(mnemonicList[index])) {
        continue;
      } else {
        randomList.add(mnemonicList[index]);
        print('$count -------> ${mnemonicList[index]}');
        count++;
        setState(() {});
      }
    } while (count < mnemonicList.length);
  }

  //验证两个数组是否一致（元素，位置都一致）
  bool twoListIsEqual(List listA, List listB) {
    if (listA == listB) return true;
    if (listA == null || listB == null) return false;
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
      if (listA[i] != listB[i]) {
        return false;
      }
    }
    return true;
  }
}
