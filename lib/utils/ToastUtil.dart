import 'package:fluttertoast/fluttertoast.dart';

/// Toast弹窗工具
class ToastUtil{

  static show(String msg){
    Fluttertoast.showToast(msg: msg,toastLength:Toast.LENGTH_SHORT);

  }

}