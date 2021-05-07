import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 360 = 2 * PI 弧度
/// n 度 = n * PI / 180 弧度

class PlayerInner extends HookWidget {
  const PlayerInner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final d = useState(0.0);

    /// 定时器控制弧度
    Timer(Duration(microseconds: 16), () {
      d.value++;
    });

    return Container(
      margin: EdgeInsets.only(top: screen.calc(182)),
      child: Stack(
        children: [
          // 唱片
          Positioned(
            child: Transform.rotate(
              angle: d.value * pi / 180,
              child: Container(
                width: screen.calc(618),
                height: screen.calc(618),
                child: Stack(
                  children: [
                    // 封面
                    Center(
                      child: Container(
                        color: Colors.black,
                        child: Image.asset(
                          'assets/tmp_cover_7.jpg',
                          width: screen.calc(400),
                          height: screen.calc(400),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Image.asset('assets/player-disc.png'))
                  ],
                ),
              ),
            ),
          ),
          // arm
          Positioned(child: Image.asset('assets/player-arm.png'))
        ],
      ),
    );
  }
}
