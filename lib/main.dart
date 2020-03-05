import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/utils/ToastUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        child: MyHomePage(title: 'Flutter Demo Home Page'),
        onWillPop: () async {
          Fluttertoast.showToast(msg: "点击了返回键");
          return false;
        },
      ),
    );

    return materialApp;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("xxxx:build()");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Offstage(
              //动态控制控件的显示与隐藏
              offstage: _counter > 10 ? true : false,
              child: Text('按钮已经点击次数'),
            ),
            /* Text(
              '按钮已点击次数:',
            ),*/
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

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
                  onPressed: () {},
                  child: Text("登录"),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
