import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/util/player_util.dart';

/// player区
import 'package:music/pages/player/header.dart';
import 'package:music/pages/player/player_inner.dart';
import 'package:music/pages/player/control_panel_first.dart';
import 'package:music/pages/player/control_panel_second.dart';
import 'package:music/pages/player/progress.dart';
import 'package:music/util/system_util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlayerPage extends HookWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final args = ModalRoute.of(context).settings.arguments as Map;

    /// 使用hook，暂时控制播放按钮的状态
    final playing = useState(false);

    /// 判断Android去除最上方栏
    setStatusBarStyle(Brightness.light);

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/tmp_cover_7.jpg',
          width: screen.width,
          height: screen.height,
          fit: BoxFit.fill,
        ),

        /// 播放器图片毛玻璃
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        )),
        Container(
          padding: EdgeInsets.only(
              top: screen.top, left: screen.calc(24), right: screen.calc(24)),
          child: Column(
            children: [
              Header(),
              PlayerInner(
                playing: playing.value,
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            width: screen.width,
            child: Container(
              // color: Colors.red,
              child: Column(
                children: [
                  ControlPageOne(
                    heart: true,
                    onDownload: () {
                      print('a');
                    },
                    onBell: () {
                      print('b');
                    },
                  ),
                  ProgressPage(
                    total: 300,
                    current: 100,
                  ),
                  ControlPageSecond(
                    playing: playing.value,
                    onPlayTap: () {
                      playing.value = true;
                    },
                    onPauseTap: () {
                      playing.value = false;
                    },
                    onBackward: () {
                      print('back');
                    },
                    onForward: () {
                      print('forward');
                    },
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
