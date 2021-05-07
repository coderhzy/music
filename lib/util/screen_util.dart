import 'package:flutter/material.dart';

/// 设计图大小
const _Width = 750;

/***
 * result = value * width / _Width
 * width = screen.size.width 媒体查询 屏幕宽度
 * _Width 设计稿宽度
 * value 测量值
 * 400 / 750 = ? / 430
 * 400: 在设计稿中的测量值 ， 750:设计稿宽度 ， 430： 媒体查询手机宽度 , ? ：我们需要根据比例算出的值
 * ? = 400 * 430 / 750
 */
class Screen {
  /// dart中实例化必须使用var, 不能使用final
  var screen;
  var width,height,top;

  Screen(BuildContext context) {
    /// 媒体查询
    this.screen = MediaQuery.of(context);

    /// 屏幕的宽高
    width = screen.size.width;
    height = screen.size.height;
    top = screen.padding.top;
  }

  double calc(double value) {
    /// value: 我们需要设置的宽度 ， width: screen.size.with获取的屏幕的宽度 ，_Width：设计图的宽度
    return value * width / _Width;
  }
}

/// 设计稿 750 400   400 / 750 = 0.533
/// 实际  430  ?     0.53
/// ? / 430 = 0.53
/// ? = 430 * 0.53
/// 替换0.53
/// ? = 430 * 400 / 750
/// 替换430为媒体查询screen.width ， 400在设计稿中的测量值 , 750 设计稿总宽度
/// 最终返回 result = value * width / _Width