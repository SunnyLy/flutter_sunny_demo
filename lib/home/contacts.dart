import 'package:flutter/material.dart';

/// @Annotation <p>联系人</p>
/// @Auth  Sunny
/// @date 2020/5/5
/// @Version V1.0.0
class Contacts extends StatefulWidget {
  Contacts({Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "联系人",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
