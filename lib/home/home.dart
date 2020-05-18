import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/constant/Constants.dart';
import 'file:///D:/workspace/flutter_workspace/flutter_sunny_demo/lib/home/chat/chat.dart';
import 'package:flutter_sunny_demo/home/contacts.dart';
import 'package:flutter_sunny_demo/home/found.dart';
import 'package:flutter_sunny_demo/home/mine.dart';
import 'package:flutter_sunny_demo/search/search_page.dart';
import 'package:flutter_sunny_demo/utils/SunnyRoute.dart';
import 'package:flutter_sunny_demo/widgets/bottom_tab_bar.dart';
import 'package:flutter_sunny_demo/widgets/bottom_tab_bar_item.dart';

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

  //当前index
  int _curIndex = 0;

  //与底部导航栏对应的页面
  List<Widget> pages = [Chat(), Contacts(), Found(), Mine()];
}

class _HomePageState extends State<HomePage> {
  var _pageController = new PageController(initialPage: 0);

  //消息未读数
  var _redCount = 50;

  List _appbarDatas = [
    {"icon_codePoint": 0xe66c, "tag": "添加好友", "color": Colors.white},
    {"icon_codePoint": 0xe611, "tag": "扫一扫", "color": Colors.white},
    {"icon_codePoint": 0xe64d, "tag": "收付款", "color": Colors.white},
    {"icon_codePoint": 0xe60d, "tag": "帮助与反馈", "color": Colors.white}
  ];

  List<PopupMenuItem> getPopupMenuItems() {
    return _appbarDatas.map((item) {
      return PopupMenuItem(
          child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
            height: 30,
            child: Icon(
              IconData(item['icon_codePoint'], fontFamily: 'AppBarIcons'),
              color: item['color'],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Text(
              item['tag'],
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        //放搜索，加号等 图标
        actions: <Widget>[
          GestureDetector(
              child: GestureDetector(
            child: Icon(
              IconData(0xe608, fontFamily: 'AppBarIcons'),
            ),
            onTap: () {
//              Navigator.of(context)
//                  .pushNamed(Constants.route_search);

              //采用自定义的路由，实现界面跳转动画
              Navigator.of(context)
                  .push(SunnyRoute(SearchPage(), RouteType.FADE));
            },
          )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 15, 15),
            child: GestureDetector(
              child: Icon(IconData(0xe84f, fontFamily: 'AppBarIcons')),
              onTap: () {
                //点击时弹出popupwindow
                showMenu(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    context: context,
                    elevation: 1,
                    color: Color(0xFF545454),
                    position: RelativeRect.fromLTRB(0, 80, -10, 0),
                    items: getPopupMenuItems());
              },
            ),
          ),
        ],
      ),
      //加个底部导航栏
      bottomNavigationBar: BottomTabBar(
        badgeColor: Colors.redAccent,
        items: [
          BottomTabBarItem(
              icon: Icon(IconData(0xe603, fontFamily: 'BottomNavigtionIcons')),
              //注意一定要放到font目录下
//                activeIcon: Image.asset(Res.icon_wechat_selected,width: 24,height: 24,),
              activeIcon:
                  Icon(IconData(0xe7fe, fontFamily: 'BottomNavigtionIcons')),
              badgeNo: _redCount,
              title: Text("聊天")),
          BottomTabBarItem(
            icon: Icon(IconData(0xe600, fontFamily: 'BottomNavigtionIcons')),
            activeIcon:
                Icon(IconData(0xe601, fontFamily: 'BottomNavigtionIcons')),
            title: Text("联系人"),
          ),
          BottomTabBarItem(
              icon: Icon(IconData(0xe640, fontFamily: 'BottomNavigtionIcons')),
              activeIcon:
                  Icon(IconData(0xe62a, fontFamily: 'BottomNavigtionIcons')),
              title: Text("发现")),
          BottomTabBarItem(
              icon: Icon(IconData(0xe6cf, fontFamily: 'BottomNavigtionIcons')),
              activeIcon:
                  Icon(IconData(0xe624, fontFamily: 'BottomNavigtionIcons')),
              title: Text("我的"))
        ],
        currentIndex: widget._curIndex,

        //点击监听
        onTap: (int selectIndex) {
          _pageController.jumpToPage(selectIndex);
        },
//          type: BottomNavigationBarType.shifting,//点击tab时，以渐显的效果出现
        type: BottomTabBarType.fixed,
        //点击tab时，以渐显的效果出现
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black54,
      ),
      body: PageView.builder(
          onPageChanged: _pageChange,
          itemCount: widget.pages.length,
          controller: _pageController, //用于将页面与底部导航栏关联起来
          itemBuilder: (context, index) {
            return widget.pages.elementAt(index);
          }),
    );
  }

  Color textColor() {
    return Colors.black54;
  }

  ///滑动页面
  void _pageChange(int value) {
    setState(() {
      widget._curIndex = value;
    });
  }
}
