import 'package:flutter/material.dart';
import 'package:wallet/pages/medical_insurance.dart';
import 'package:wallet/pages/wallet_account.dart';
import 'package:wallet/pages/mine_page.dart';

class TabNavigatorPage extends StatefulWidget {
  TabNavigatorPage({Key key}) : super(key: key);

  @override
  _TabNavigatorPageState createState() => _TabNavigatorPageState();
}

class _TabNavigatorPageState extends State<TabNavigatorPage> {
  List<Widget> pages = [WalletAccountPage(),MedicalInsurancePage(), MinePage()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: '资产',
            icon: Image.asset('images/img-zichan.png', width: 22),
            activeIcon: Image.asset('images/img-zichan-xz.png', width: 22),
          ),

          BottomNavigationBarItem(
            label: '医保',
            icon: Icon(Icons.medical_services_outlined,size: 22,),
            // activeIcon: Image.asset('images/img-zichan-xz.png', width: 22),
          ),
          
          BottomNavigationBarItem(
            label: '我的',
            icon: Image.asset('images/img-wode.png', width: 22),
            activeIcon: Image.asset('images/img-wode-xz.png', width: 22),
          )
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
