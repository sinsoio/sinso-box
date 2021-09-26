import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_autosize_screen/auto_size_util.dart';
import 'package:flutter_autosize_screen/binding.dart';
import 'package:get/get.dart';
import 'package:wallet/pages/splash.dart';
import 'package:wallet/routes.dart';
import 'package:wallet/routes_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AutoSizeUtil.setStandard(375, isAutoTextSize: true);
  await SpUtil.getInstance();
  runAutoApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.Initial,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.pages,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: AutoSizeUtil.appBuilder(context, child),
        ),
        resizeToAvoidBottomInset: false,
      ),
      // builder: AutoSizeUtil.appBuilder,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashPage(),
    );
  }
}
