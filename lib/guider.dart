import 'package:flutter/material.dart';

///
///@Annotation <p>描述</p>
///@Author Sunny
///@Date 2020/3/10 9:47
///@Version V1.0.0
///
class GuiderPage extends StatefulWidget {
  GuiderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GuiderPageState createState() => _GuiderPageState();
}

class _GuiderPageState extends State<GuiderPage> {

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