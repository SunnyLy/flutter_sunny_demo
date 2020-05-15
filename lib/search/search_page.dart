import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/constant/Constants.dart';
import 'package:flutter_sunny_demo/widgets/search_widget.dart';

/// @Annotation <p>搜索界面</p>
/// @Auth  Sunny
/// @date 2020/5/15
/// @Version V1.0.0
class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFEBECEC),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                  child: Text(
                    '搜索指定内容',
                    style: TextStyle(color: Color(0xFFD3D3D3), fontSize: 24),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: GridView(
                shrinkWrap: true,
                //当GridView嵌套在Column里面时，显示空白的解决办法：1，shrinkWrap为true;2,利用Expand包裹
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, childAspectRatio: 1.0),
                children: <Widget>[
                  Text(
                    '朋友圈',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF586A8C),
                      fontSize: 24,
                    ),
                  ),
                  VerticalDivider(
                    //竖线
                    width: 1.0,
                    endIndent: 50,
                    color: Colors.grey,
                  ),
                  Text(
                    '文章',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF586A8C),
                      fontSize: 24,
                    ),
                  ),
                  VerticalDivider(
                    //竖线
                    width: 1.0,
                    endIndent: 50,
                    color: Colors.grey,
                  ),
                  Text('公众号',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF586A8C),
                        fontSize: 24,
                      )),
                  Text(
                    '小程序',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF586A8C),
                      fontSize: 24,
                    ),
                  ),
                  VerticalDivider(
                    //竖线
                    width: 1.0,
                    endIndent: 50,
                    color: Colors.grey,
                  ),
                  Text(
                    '音乐',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF586A8C),
                      fontSize: 24,
                    ),
                  ),
                  VerticalDivider(
                    //竖线
                    width: 1.0,
                    endIndent: 50,
                    color: Colors.grey,
                  ),
                  Text('表情',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF586A8C),
                        fontSize: 24,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEBECEC),
        automaticallyImplyLeading: false,
        //去掉返回键
        title: SearchWidget(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[300],
          ),
          height: 45,
        ),
        actions: <Widget>[
          GestureDetector(
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Text(
                    '取消',
                    style: TextStyle(
                      color: Color(0xFF586A8C),
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              //点击取消
              Navigator.pop(context, Constants.route_home);
            },
          )
        ],
      ),
    );
  }
}
