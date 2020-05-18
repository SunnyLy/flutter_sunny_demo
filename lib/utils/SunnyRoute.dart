import 'package:flutter/cupertino.dart';

///自定义路由工具
/// 2020/5/18 16:50

enum RouteType {
  FADE, //渐变效果
  SCALE, //缩放
  ROTATION, //旋转
  SLIDE, //左右滑动
}

class SunnyRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteType routeType;

  SunnyRoute(this.widget, this.routeType)
      : super(pageBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation1,
            Animation<double> animation2,
            Widget child) {
          switch (routeType) {
            case RouteType.FADE:
              return FadeTransition(
                //渐变效果
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
              break;
            case RouteType.ROTATION: //旋转效果
              return RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn),
                ),
                child: child,
              );
              break;
            case RouteType.SCALE: //缩放效果
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
              break;
            case RouteType.SLIDE: //左右滑动效果
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
              break;
            default:
              {
                return getCommTransition(); //基它效果，由子类实现
              }
              break;
          }
        });
}

Widget getCommTransition() {
  return null;
}
