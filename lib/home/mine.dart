import 'package:flutter/material.dart';

/// @Annotation <p>我的</p>
/// @Auth  Sunny
/// @date 2020/5/5
/// @Version V1.0.0
class Mine extends StatefulWidget {
  Mine({Key key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "我的",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
