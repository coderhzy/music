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

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final args = ModalRoute.of(context).settings.arguments as Map;

    /// 判断Android去除最上方栏
    setStatusBarStyle(Brightness.light);

    print(args);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: screen.top, left: screen.calc(24), right: screen.calc(24)),
        decoration: BoxDecoration(color: Color(0x99000000)),
        child: Column(
          children: [
            Header(),
            PlayerInner(),
            ControlPageOne(),
            ProgressPage(),
            ControlPageSecond(),
          ],
        ),
      ),
    );
  }
}
