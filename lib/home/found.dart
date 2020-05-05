import 'package:flutter/material.dart';

/// @Annotation <p>发现</p>
/// @Auth  Sunny
/// @date 2020/5/5
/// @Version V1.0.0
class Found extends StatefulWidget {
  Found({Key key}) : super(key: key);

  @override
  _FoundState createState() => _FoundState();
}

class _FoundState extends State<Found> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "发现",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
