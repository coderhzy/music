import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 媒体查询获取屏幕
    final screen = Screen(context);
    // 状态栏
    // screen.padding.top
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Container(
      decoration: BoxDecoration(color: Color(0xffc93e2d)),
      child: Stack(
        children: [
          Positioned(
              top: screen.calc(600),
              left: screen.calc((750 - 450) / 2),
              child: Image.asset(
                'assets/splash_logo.png',
                width: screen.calc(450),
                height: screen.calc(89),
              )),
          Positioned(
            bottom: screen.calc(41),
            left: screen.calc(264),
            child: Image.asset('assets/splash_logo_sm.png',
                width: screen.calc(222), height: screen.calc(51)),
          )
        ],
      ),
    );
  }
}
