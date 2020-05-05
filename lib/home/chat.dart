import 'package:flutter/material.dart';

/// @Annotation <p>聊天列表界面</p>
/// @Auth  Sunny
/// @date 2020/5/5
/// @Version V1.0.0
class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "聊天界面",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.redAccent,
    );
  }
}
