import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/utils/ToastUtil.dart';

/// @Annotation <p>搜索控件</p>
/// @Auth  Sunny
/// @date 2020/5/15
/// @Version V1.0.0
class SearchWidget extends StatefulWidget {
  SearchWidget({
    Key key,
    this.prefixIcon,
    this.hint: '搜索',
    this.width: double.infinity,
    this.height: 45.0,
  }) : super(key: key);

  //搜索框前面的小图标
  Icon prefixIcon = Icon(Icons.search);
  String hint;
  double width;
  double height;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  static String _inputStr = "";

  TextEditingController _textEditController =
      TextEditingController.fromValue(TextEditingValue(text: _inputStr));

  @override
  void dispose() {
    super.dispose();
    _textEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
//      height: widget.height,
      padding: EdgeInsets.all(10),
      //圆角
      decoration: BoxDecoration(
          color: Colors.grey[50], borderRadius: BorderRadius.circular(15.0)),
      child: TextField(
        controller: _textEditController,
        cursorColor: Colors.green[300],
        //光标颜色
        cursorWidth: 2,
        autofocus: true,
        enabled: true,
        textAlign: TextAlign.left,
        textInputAction: TextInputAction.search,
        //键盘上显示搜索
        maxLines: 1,
        decoration: InputDecoration(
          icon: widget.prefixIcon,
          suffixIcon: GestureDetector(
            child: Icon(
              Icons.cancel,
              color: Colors.grey[300],
            ),
            onTap: () {
              //利用控制器来清空输入的内容
              _textEditController.clear();
            },
          ),
          //清除标志
          border: InputBorder.none,
          //去掉输入框下面的线
          contentPadding: EdgeInsets.fromLTRB(2, 10, 0, 0),
          //解决输入框没有垂直居中的问题
          hintMaxLines: 1,
          hintStyle: TextStyle(color: Colors.grey[300], fontSize: 24),
          hintText: widget.hint,
        ),
        onChanged: (String inputStr) {
          _inputStr = inputStr;
        },
      ),
    );
  }
}
