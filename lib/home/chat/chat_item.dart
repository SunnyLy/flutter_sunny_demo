import 'package:flutter/material.dart';

/// @Annotation <p>聊天列表界面</p>
/// @Auth  Sunny
/// @date 2020/5/7
/// @Version V1.0.0
class ChatItem extends StatefulWidget {
  ChatItem({Key key, this.avatarUri}) : super(key: key);
  String avatarUri;

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          //头像
          SizedBox(
            width: 50,
            height: 50,
          )
        ],
      ),
    );
  }
}
