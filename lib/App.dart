import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/constant/Constants.dart';
import 'package:flutter_sunny_demo/splash.dart';

import 'LoginPage.dart';

///
///@Annotation <p>闪屏页面</p>
///@Author Sunny
///@Date 2020/3/10 9:24
///@Version V1.0.0
///

void main() => runApp(AppPage());

class AppPage extends StatefulWidget {
  AppPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      //注册路由
      routes: {
        Constants.route_main: (context) => MainPage(),
      },
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: SplashPage(),

      ///闪屏页关键的页面路由
    );
    return app;
  }

  void init() {}
}
