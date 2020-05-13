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
  static var _curTime = DateTime.now();
  int _hour = _curTime.hour;
  int _minutes = _curTime.minute;

  static List _itemContentList = [
    {
      "icon": Res.icon1,
      "title": "集团司令部群一",
      "msg": "接到上级通知：内容内容内容内容内容内容内容。",
      "time": "14:39:40"
    },
    {
      "icon": Res.icon2,
      "title": "集团司令部群二",
      "msg": "接到上级通知：内容内容内容内容内容内容内容。",
      "time": "14:39:40"
    },
    {
      "icon": Res.icon3,
      "title": "集团司令部群三",
      "msg": "接到上级通知：内容内容内容内容内容内容内容。",
      "time": "14:39:40"
    },
    {
      "icon": Res.icon4,
      "title": "集团司令部群四",
      "msg": "接到上级通知：内容内容内容内容内容内容内容。",
      "time": "14:39:40"
    }
  ];

  static Widget getItemWidget(item) {
    /// 直接用官方的Listtile来实现
    Widget _listTile = ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(item["icon"]), fit: BoxFit.cover)),
      ),
      title: Text(item['title']),
      subtitle: Text(
        item['msg'],
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(item['time']), //用于展示在标题后面
    );

    return Column(
      children: <Widget>[
        _listTile,
        Padding(
          padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.grey[400],
          ),
        )
      ],
    );
  }

  Widget _buildLV = ListView.builder(
      itemCount: _itemContentList.length,
      itemBuilder: (buildContext, index) {
        return getItemWidget(_itemContentList[index]);
      });

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildLV);
  }
}
