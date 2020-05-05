import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/home/chat.dart';
import 'package:flutter_sunny_demo/home/contacts.dart';
import 'package:flutter_sunny_demo/home/found.dart';
import 'package:flutter_sunny_demo/home/mine.dart';
import 'package:flutter_sunny_demo/res.dart';
import 'package:flutter_sunny_demo/widgets/bottom_navigator.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //加个底部导航栏
//        bottomNavigationBar: BottomNavigator(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
//                icon: Image.asset(
//                  Res.icon_wechat,
//                  width: 24,
//                  height: 24,
//                ),
//            icon: Icon(Icons.airplanemode_inactive),
              icon: Icon(IconData(0xe603, fontFamily: 'BottomNavigtionIcons')),
              //注意一定要放到font目录下
//                activeIcon: Image.asset(Res.icon_wechat_selected,width: 24,height: 24,),
//            activeIcon: Icon(Icons.airplanemode_active),
              activeIcon:
                  Icon(IconData(0xe7fe, fontFamily: 'BottomNavigtionIcons')),
//              activeIcon: Icon(Icons.title),
              title: Text("聊天")),
//              icon: Icon(Icons.w), title: Text("微信")),
          BottomNavigationBarItem(
//                icon: Image.asset(
//                  Res.icon_connect,
//                  width: 24,
//                  height: 24,
//                ),
              icon: Icon(IconData(0xe600, fontFamily: 'BottomNavigtionIcons')),
              activeIcon:
                  Icon(IconData(0xe601, fontFamily: 'BottomNavigtionIcons')),
              title: Text("联系人")),
          BottomNavigationBarItem(
//                icon: Image.asset(
//                  Res.icon_found,
//                  width: 24,
//                  height: 24,
//                ),
              icon: Icon(IconData(0xe640, fontFamily: 'BottomNavigtionIcons')),
              activeIcon:
                  Icon(IconData(0xe62a, fontFamily: 'BottomNavigtionIcons')),
              title: Text("发现")),
          BottomNavigationBarItem(
//                icon: Image.asset(
//                  Res.icon_mine,
//                  width: 24,
//                  height: 24,
//                ),
              icon: Icon(IconData(0xe6cf, fontFamily: 'BottomNavigtionIcons')),
              activeIcon:
                  Icon(IconData(0xe624, fontFamily: 'BottomNavigtionIcons')),
              title: Text("我的"))
        ],
        currentIndex: widget._curIndex,

        //点击监听
        onTap: (int selectIndex) {
//          _pageController.animateToPage(selectIndex,
//              duration: Duration(milliseconds: 300), curve: Curves.ease);
        _pageController.jumpToPage(selectIndex);
        },
//          type: BottomNavigationBarType.shifting,//点击tab时，以渐显的效果出现
        type: BottomNavigationBarType.fixed,
        //点击tab时，以渐显的效果出现
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.black54,
      ),
//        body: Center(//为了实现滑动翻页，我们需要将Center换成Pageview
//          child: widget.pages[widget._curIndex],
//        ) // This trailing comma makes auto-formatting nicer for build methods.

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
//    return (widget._curIndex == widget._selectIndex)
//        ? Colors.greenAccent
//        : Colors.black54;

    return Colors.black54;
  }

  ///滑动页面
  void _pageChange(int value) {
    setState(() {
      widget._curIndex = value;
    });
  }
}
