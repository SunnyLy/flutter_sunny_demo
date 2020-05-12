import 'package:flutter/material.dart';

/// @Annotation <p>带红点的icon</p>
/// @Auth  Sunny
/// @date 2020/5/7
/// @Version V1.0.0
class IconRed extends StatefulWidget {
  IconRed({Key key, this.showReddot, this.count, this.iconImage, this.iconData})
      : super(key: key);

  ///是否显示红点
  bool showReddot = false;

  //消息未读数
  int count;

  //有些icon是加载本地资源
  Image iconImage;

  //有些是包装数据，例如字体图标
  IconData iconData;

  @override
  _IconRedState createState() => _IconRedState();
}

class _IconRedState extends State<IconRed> {
  @override
  Widget build(BuildContext context) {
    var _iconData = widget.iconData;
    var _iconImage = widget.iconImage;
    var _count = widget.count;
    var _iconWidget;
    if (_iconData != null) {
      _iconWidget = Icon(_iconData);
    } else if (_iconImage != null) {
      _iconWidget = _iconImage;
    } else {
      throw ArgumentError("the iconData or iconImage must not all null");
    }
    return Container(
      alignment: AlignmentDirectional.topEnd,
      width: 30,
      height: 15,
      child: Stack(
        children: <Widget>[
          _iconWidget,
          Positioned(
            right: 4,
            top: 4,
            child: Material(
              child: Text(
                "$_count",
                style: TextStyle(
                    backgroundColor: Colors.red,
                    color: Colors.white,
                    fontSize: 14),
              ),
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}
