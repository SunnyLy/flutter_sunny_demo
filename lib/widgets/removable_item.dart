import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/utils/ToastUtil.dart';

/// @Annotation <p>可滑动删除的Item</p>
/// 用动画来实现
/// @Auth  Sunny
/// @date 2020/5/19
/// @Version V1.0.0
class RemovableItem extends StatefulWidget {
  RemovableItem(
      {Key key,
      this.visible,
      this.unvisible,
      this.height,
      this.moveItemKey,
      this.onActionDown})
      : super(key: moveItemKey);

  GlobalKey<RemovableItemState>
      moveItemKey; //用key的唯一性来标志Item的唯一。从而实行对每个Item的精准操作
  Widget visible; //可见的
  Widget unvisible; //不可见的
  double height; //高度
  VoidCallback onActionDown; //手指按下的回调

  @override
  RemovableItemState createState() => RemovableItemState();
}

class RemovableItemState extends State<RemovableItem>
    with SingleTickerProviderStateMixin {
  AnimationController slideController;
  double offset = 0.0; //初始偏移量
  double maxDis = 160.0; //滑动的最大距离
  bool opened = false; //列表中是否有打开的列表
  double moveDis = 0.0; //滑动的偏移量

  @override
  void initState() {
    super.initState();
    slideController = AnimationController(
        lowerBound: 0,
        upperBound: maxDis,
        duration: const Duration(seconds: 1),
        vsync: this)
      ..addListener(() {
        offset = slideController.value;
        setState(() {});
      });
  }

  @override
  void dispose() {
    if (slideController != null) {
      slideController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Positioned(
                right: 80.0,
                child: InkWell(
                  onTap: () {
                    ToastUtil.show("收藏成功");
                  },
                  child: Container(
                    width: 80.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  ToastUtil.show("删除成功");
                },
                child: Container(
                  width: 80.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: Icon(Icons.delete),
                ),
              ),
            ),
            Positioned(
              child: widget.visible,
              height: 200,
              left: -offset,
              right: offset,
            ),
          ],
        ),
        onHorizontalDragDown: (DragDownDetails dragDownDetails) {
          //手指按下开始滑动时操作
          //关闭其他所有打开的item项
          closeItems();
          return widget.onActionDown();
        },
        onHorizontalDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          //滑动中。
          setState(() {
            offset -= dragUpdateDetails.delta.dx; //水平滑动取X轴的差值
            print("水平方向上滑动的距离:$moveDis");
            if (offset < 0) {
              offset = 0;
            }
            if (offset >= maxDis) {
              offset = maxDis;
            }
          });
        },
        onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
          //滑动结束
          slideController.value = offset;
          if (offset >= maxDis) {
            opened = true;
          } else if (offset > maxDis / 2) {
            //滑动到最大距离一半时，执行动画，至打开item
            opened = true;
            slideController.animateTo(maxDis);
          } else {
            closeItems();
          }
        },
      ),
    );
  }

  ///关闭所有打开的item
  void closeItems() {
    slideController.animateTo(0.0);
    opened = false;
  }
}
