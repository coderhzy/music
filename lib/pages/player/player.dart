import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music/pages/player/play_info.dart';
import 'package:music/pages/player/play_list.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/util/play_state.dart';

/// player区
import 'package:music/pages/player/header.dart';
import 'package:music/pages/player/player_inner.dart';
import 'package:music/pages/player/control_panel_first.dart';
import 'package:music/pages/player/control_panel_second.dart';
import 'package:music/pages/player/progress.dart';
import 'package:music/util/system_util.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final args = ModalRoute.of(context).settings.arguments as Map;

    /// 使用hook，暂时控制播放按钮的状态
    // final playing = useState(false);
    final playState = PlayState.of(context);
    // 单例
    // final player = getPlayer();

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
              PlayerInner(playing: playState.playing),
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
                    onSetting: (){
                      showPlayInfo(context);
                    },

                  ),
                  ProgressPage(
                    total: playState.total,
                    current: playState.current,
                  ),
                  ControlPageSecond(
                    playing: playState.playing,
                    onPlayTap: () {
                      playState.player.play(
                          'https://codehzy.cn/pname/flutter/music/music_0.mp3');
                    },
                    onPauseTap: () async {
                      await playState.player.pause();
                    },
                    onBackward: () {
                      print('back');
                    },
                    onForward: () {
                      print('forward');
                    },
                    onPlaylist: () {
                      showPlayList(context);
                    },
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
