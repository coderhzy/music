import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/util/play_state.dart';
import 'package:music/util/arc_progress.dart';

/// 右上角播放头像按钮组件封装
class Playing extends StatelessWidget {
  const Playing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final playState = PlayState.of(context);

    final size = screen.calc(60);
    // final size=screen.calc(200);
    final borderWidth = screen.calc(3);
    // final borderWidth=screen.calc(30);

    var percent = 0.0;

    if (playState.current != null && playState.total != null) {
      percent = playState.current / playState.total;
    }
    return Hero(
      tag: 'right_top_playing_icon',
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/player');
          },
          child: Container(
              width: size,
              height: size,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 3, top: 3),
                    width: size - 6,
                    height: size - 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/tmp_icon_music.png'),
                      ),
                      borderRadius: BorderRadius.circular(size / 2),
                    ),
                  ),
                  Positioned.fill(
                      child: ArcProgress(
                    percent: percent,
                    width: borderWidth,
                    color: Color(0xffff3a3a),
                    bgColor: Color(0xffe5e5e5),
                  )),
                ],
              ))),
    );
  }
}

// return Hero(
// /// 使用Hero去除在页面切换时候的动画
// tag: 'right_top_playing_icon',
// child: Container(
// width: screen.calc(60),
// height: screen.calc(60),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(screen.calc(30)),
// border: Border.all(width: screen.calc(3), color: Color(0xffe5e5e5)),
// image: DecorationImage(
// image: AssetImage(
// 'assets/tmp_icon_music.png',
// ),
// )),
// ),
// );
