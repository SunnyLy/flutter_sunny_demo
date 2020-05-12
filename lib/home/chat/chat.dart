import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/res.dart';

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
  static var _itemView = Container(
      child: SizedBox(
    width: double.infinity, //最大宽度
    height: 100,
    child: Stack(
      children: <Widget>[
        SizedBox(
            width: 80,
            height: 80,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(Res.demo_logo),
            ) //头像,
            ),
        Positioned(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "海陆空集团司令部",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          left: 100,
        ), //昵称
        Positioned(
            left: 100,
            top: 50,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text("Sunny:@李将军 来我办公室一趟。",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            )), //消息
      ],
    ),
  )); //子项布局
  var _simpleLV = ListView(
    children: <Widget>[_itemView, _itemView, _itemView, _itemView],
  ); //简单的Listview,适用于已知item个数的列表
  @override
  Widget build(BuildContext context) {
    return Container(child: _simpleLV);
  }
}
