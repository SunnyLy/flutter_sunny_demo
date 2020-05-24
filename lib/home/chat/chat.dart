import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/res.dart';
import 'package:flutter_sunny_demo/widgets/removable_item.dart';

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

  static List<GlobalKey<RemovableItemState>> childItemStates = [];

  @override
  void initState() {
    super.initState();
    initChildItemStates();
  }

  void initChildItemStates() {
    childItemStates.clear();
    for (int i = 0; i < _itemContentList.length; i++) {
      GlobalKey<RemovableItemState> removeGK = GlobalKey(debugLabel: "$i");
      childItemStates.add(removeGK);
    }
    setState(() {});
  }

  static Widget getItemWidget(List list, int index, BuildContext context) {
    /// 直接用官方的Listtile来实现
    ///
    var item = list[index];
    Widget _listTile = ListTile(
      leading: Container(
        width: 60,
        height: 100.0,
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
//        _listTile,
        RemovableItem(
          visible: Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            color: Colors.white,
            child: _listTile,
          ),
          moveItemKey: childItemStates[index],
          onActionDown: () {
            //循环遍历列表，关闭非当前item打开项
            closeItems(childItemStates, index);
          },
        ),
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
        return getItemWidget(_itemContentList, index, buildContext);
      });

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildLV);
  }

  /// 循环遍历，利用State.来关闭非当前Item
  static void closeItems(
      List<GlobalKey<RemovableItemState>> childItemStates, int index) {
    childItemStates.forEach((element) {
      if (element != childItemStates[index]) {
        element.currentState?.closeItems();
      }
    });
  }
}
