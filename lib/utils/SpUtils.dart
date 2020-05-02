///Flutter 中的Sharepreference工具
///提供单例初始化方法，在App中初始化
/// 2020/3/12 20:51

import 'package:flutter/material.dart';
import 'package:flutter_sunny_demo/constant/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class SpUtils {
  static SpUtils mInstance;
  static SharedPreferences mSharePreference;
  static Lock lock = Lock();

  /// 仿Java的单例初始化
  static Future<SpUtils> getInstance() async {
    if (mInstance == null) {
      await lock.synchronized(() async {
        if (mInstance == null) {
          var singleton = SpUtils._();
          await singleton._init(); //等SpUtils初始化完成
          mInstance = singleton;
        }
      });
    }
    return mInstance;
  }

  SpUtils._();

  ///sharepreference初始化
  Future _init() async {
    mSharePreference = await SharedPreferences.getInstance();
  }

  ///是否为首次打开
  static bool isFirstOpen() {
    assert(mSharePreference != null, "SpUtils没有初始化");
    return mSharePreference.getBool(Constants.first_open) ?? true;
  }

  static void putBool(String key, bool result) {
    mSharePreference.setBool(key, result);
  }
}
