import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/constant/Constants.dart';
import 'package:flutter_sunny_demo/home/home.dart';
import 'package:flutter_sunny_demo/res.dart';
import 'package:flutter_sunny_demo/utils/SpUtils.dart';

import 'LoginPage.dart';

///
///@Annotation <p>闪屏页面</p>
///@Author Sunny
///@Date 2020/3/10 9:24
///@Version V1.0.0
///

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _totalTime = 5; //5秒倒计时
  var _count = 0; //用于文本显示
  Timer _timer;

  @override
  void initState() {
    super.initState();
    init();
    startCutdown();
  }

  void init() {
    refreshUI(_totalTime);
  }

  ///开始倒计时
  void startCutdown() {
    var interval = 1; //间隔1秒
    _timer = Timer.periodic(Duration(seconds: interval), (timer) {
      int time = _totalTime - interval;
      _totalTime = time;
      print("剩余时间：$time");
      if (time >= interval) {
        refreshUI(time);
      }

      if (time == 0) {
        refreshUI(time);
        cancel();
      } else if (time < interval) {
        timer.cancel();
        Future.delayed(Duration(seconds: time), () {
          _totalTime = 0;
          refreshUI(_totalTime);
          cancel();
        });
      }

      print("_count:$_totalTime");
      if (_totalTime == 0) {
        jumpPage();
      }
    });
  }

  ///刷新界面
  void refreshUI(int time) {
    setState(() {
      _count = time;
      print("refreshUI:$_count");
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Stack(
        alignment: Alignment(1.0, 1.0),
        children: <Widget>[
          Image(
            image: AssetImage(Res.splash_bg),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
                width: 50,
                height: 45,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 15, 0),
                  child: Text(
                    "${_count}s",
                    style:
                        TextStyle(fontSize: 14, backgroundColor: Colors.grey),
                  ),
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              widthFactor: 1,
              heightFactor: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Constants.route_main);
                    },
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("跳过>>")),
              ))
        ],
      ),
    );
    return app;
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  ///页面跳转
  void jumpPage() {
    var isfirstOpen = isFirstOpen(); //是否为首次打开，或者应用更新
    if (!isfirstOpen) {
      Navigator.of(context).pushReplacementNamed(Constants.route_main);
    } else {
      Navigator.of(context).pushReplacementNamed(Constants.route_guider);
      SpUtils.putBool(Constants.first_open, false);
    }
  }

  ///判断应用是否首次打开，或者应用版本升级更新
  bool isFirstOpen() {
    return SpUtils.isFirstOpen();
  }
}
