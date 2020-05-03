import 'package:flutter/material.dart';

/**@Annotation <p>包含图片、文字的按钮</p>
 * @Auth  Sunny
 * @date 2020/5/3
 * @Version V1.0.0
 */
class RichTextButton extends StatefulWidget {
  RichTextButton({Key key, this.title, this.iconUri}) : super(key: key);

  //富文本的名字与icon
  final String title;
  final String iconUri;

  @override
  _RichTextButtonState createState() => _RichTextButtonState();
}

class _RichTextButtonState extends State<RichTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(widget.iconUri,width: 24,height: 24,),
          Text(widget.title,textAlign: TextAlign.center,)],
      ),
    );
  }
}
