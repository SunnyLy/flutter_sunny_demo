import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/home/home.dart';
import 'package:flutter_sunny_demo/utils/ToastUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  DateTime _lastClickTime; //上次点击的时间
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        child: MyHomePage(title: 'FlutterSunnyDemo'),
        onWillPop: () async {
          if (_lastClickTime == null ||
              (DateTime.now().difference(_lastClickTime) >
                  Duration(seconds: 1))) {
            _lastClickTime = DateTime.now();
            Fluttertoast.showToast(msg: "再按一次返回桌面");
            return false;
          }

          return true;
        },
      ),
    );

    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //用户名输入框
  TextEditingController _userNameEditContr = TextEditingController();

  //密码输入框
  TextEditingController _pwdEditContr = TextEditingController();

  @override
  void initState() {
    print("xxxx:initState()");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("xxxx:didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget:${oldWidget.title}");
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("setState");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactiveate:");
  }

  @override
  void dispose() {
    print("xxxx:dispose()");
    super.dispose();
  }

  void _incrementCounter() {
    if (_counter > 12) {
      dispose();
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("xxxx:build()");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(15, 50, 15, 0),
          child: Center(
            //body得用一个Scrollview来包裹，不然调出键盘时，会报Bottom overflowed by xxx pixels错误
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//            Image(image: AssetImage('images/demo_logo.png')),
                ClipOval(
                  child: Image(
                    //用于加载图片
                    image: AssetImage('images/demo_logo.png'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ), //圆形控件

                //再添加一个layout,用于存放一个输入框，与一个文案提示
                Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '用户名:',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                            fontStyle: FontStyle.normal),
                      ),
                      Expanded(
                          flex: 1,
                          child: TextField(
                            maxLines: 1,
                            controller: _userNameEditContr,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person), hintText: "请输入用户名"),
                            keyboardType: TextInputType.text, //会弹出文本输入键盘
                          )), //用来限制输入框的宽高
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "密码",
                      ),
                      Expanded(
                          child: TextField(
                        controller: _pwdEditContr,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock), hintText: "请输入密码"),
                      ))
                    ],
                  ),
                ),

                Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(15, 30, 15, 15),
                    child: FlatButton(
                      onPressed: () {
                        //登录成功，跳转至首次
//                    Navigator.pushNamed(context, "/home/home.dart");
                        if (veryInputInfo()) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage(title: "首页");
                          }));
                        } else {
                          ToastUtil.show("请输入用户名或密码");
                        }
                      },
                      child: Text("登录"),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                    ))
              ],
            ),
          ),
        ));
  }

  /// 验证输入信息
  bool veryInputInfo() {
    final username = _userNameEditContr.text;
    final pwd = _pwdEditContr.text;
    bool result = false;
    result = (username.trim().isNotEmpty) && (pwd.trim().isNotEmpty);
    return result;
  }
}
