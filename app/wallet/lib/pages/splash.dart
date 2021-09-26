import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/entity/person.dart';
import 'package:wallet/model/person_controller.dart';
import 'package:wallet/routes.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key}) : super(key: key);

  final model = Get.put(PersonModel());


  @override
  Widget build(BuildContext context) {

    List<Person> personList = SpUtil.getObjList<Person>(
        'person', (v) => Person.fromJson(v),
        defValue: <Person>[]);
    print('______________________________${personList.length}');
    Future.delayed(Duration(milliseconds: 2000), () {
      if (personList.isEmpty) {
        Get.offAllNamed(Routes.StartPage);
      } else {
        Get.offAllNamed(Routes.TabNavigatorPage);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/img／qidong.png', width: 107),
      ),
    );
  }
}
