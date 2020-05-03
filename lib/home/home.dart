import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/widgets/bottom_navigator.dart';

///
///@Annotation <p>首页</p>
///@Author Sunny
///@Date 2020/3/5
///@Version V1.0.0
///
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        //加个底部导航栏
        bottomNavigationBar: BottomNavigator(),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
