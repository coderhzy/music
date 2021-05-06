import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';


/// 右上角播放头像按钮组件封装
class Playing extends StatelessWidget {
  const Playing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Hero(
      /// 使用Hero去除在页面切换时候的动画
      tag: 'right_top_playing_icon',
      child: Container(
        width: screen.calc(60),
        height: screen.calc(60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screen.calc(30)),
            border: Border.all(
                width: screen.calc(3), color: Color(0xffe5e5e5)),
            image: DecorationImage(
              image: AssetImage(
                'assets/tmp_icon_music.png',
              ),
            )),
      ),
    );
  }
}
