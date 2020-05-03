import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/widgets/rich_text_button.dart';
import 'package:flutter_sunny_demo/res.dart';

/**@Annotation <p>底部导航栏</p>
 * @Auth  Sunny
 * @date 2020/5/3
 * @Version V1.0.0
 */
class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//spaceBetween对行平分
        children: <Widget>[
          RichTextButton(title: "微信", iconUri: Res.icon_wechat),
          RichTextButton(title: "联系人", iconUri: Res.icon_connect),
          RichTextButton(title: "发现", iconUri: Res.icon_found),
          RichTextButton(title: "我的", iconUri: Res.icon_mine),
        ],
      ),
    );
  }
}
