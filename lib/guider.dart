import 'package:flutter/material.dart';

///
///@Annotation <p>描述</p>
///@Author Sunny
///@Date 2020/3/10 9:47
///@Version V1.0.0
///
class Page extends StatefulWidget {
  Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}