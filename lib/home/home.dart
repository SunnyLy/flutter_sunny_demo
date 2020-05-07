import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/home/chat.dart';
import 'package:flutter_sunny_demo/home/contacts.dart';
import 'package:flutter_sunny_demo/home/found.dart';
import 'package:flutter_sunny_demo/home/mine.dart';
import 'package:flutter_sunny_demo/widgets/bottom_tab_bar.dart';
import 'package:flutter_sunny_demo/widgets/bottom_tab_bar_item.dart';
import 'package:flutter_sunny_demo/widgets/icon_red.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //加个底部导航栏
//        bottomNavigationBar: BottomNavigator(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          //加红点
//          BottomNavigationBarItem(
//              icon: IconRed(
//                showReddot: true,
//                count: _redCount,
//                iconData: IconData(0xe603, fontFamily: 'BottomNavigtionIcons'),
//              ),
//              //注意一定要放到font目录下
////                activeIcon: Image.asset(Res.icon_wechat_selected,width: 24,height: 24,),
//              activeIcon: IconRed(
//                showReddot: true,
//                count: _redCount,
//                iconData: IconData(0xe7fe, fontFamily: 'BottomNavigtionIcons'),
//              ),
//              title: Text("聊天")),
//          BottomNavigationBarItem(
//              icon: Icon(IconData(0xe600, fontFamily: 'BottomNavigtionIcons')),
//              activeIcon:
//                  Icon(IconData(0xe601, fontFamily: 'BottomNavigtionIcons')),
//              title: Text("联系人"),
//          ),
//          BottomNavigationBarItem(
//              icon: Icon(IconData(0xe640, fontFamily: 'BottomNavigtionIcons')),
//              activeIcon:
//                  Icon(IconData(0xe62a, fontFamily: 'BottomNavigtionIcons')),
//              title: Text("发现")),
//          BottomNavigationBarItem(
//              icon: Icon(IconData(0xe6cf, fontFamily: 'BottomNavigtionIcons')),
//              activeIcon:
//                  Icon(IconData(0xe624, fontFamily: 'BottomNavigtionIcons')),
//              title: Text("我的"))
//        ],
//        currentIndex: widget._curIndex,
//
//        //点击监听
//        onTap: (int selectIndex) {
//          _pageController.jumpToPage(selectIndex);
//        },
////          type: BottomNavigationBarType.shifting,//点击tab时，以渐显的效果出现
//        type: BottomNavigationBarType.fixed,
//        //点击tab时，以渐显的效果出现
//        selectedItemColor: Colors.greenAccent,
//        unselectedItemColor: Colors.black54,
//      ),

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
