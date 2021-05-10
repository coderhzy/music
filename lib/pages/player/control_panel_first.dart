import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/img_button.dart';

/// 暂不使用
const iconItem = [
  {'id': 1, 'img': 'assets/icon_heart_w.png'},
  {'id': 2, 'img': 'assets/icon_download_w.png'},
  {'id': 3, 'img': 'assets/icon_bell_w.png'},
  {'id': 4, 'img': 'assets/icon_message_w.png'},
  {'id': 5, 'img': 'assets/icon_3dots_w.png'},
];

class ControlPageOne extends StatelessWidget {
  final bool heart;
  final VoidCallback onDownload;
  final VoidCallback onHeart;
  final VoidCallback onUnHeart;
  final VoidCallback onBell;
  final VoidCallback onSetting;

  const ControlPageOne(
      {Key key,
      this.heart = true,
      this.onDownload,
      this.onHeart,
      this.onUnHeart,
      this.onBell,
      this.onSetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Container(
      height: screen.calc(55),
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(

              /// 是否收藏
              child: heart
                  ? GestureDetector(
                      onTap: onUnHeart,
                      child: Image.asset('assets/icon_heart_r.png',
                          width: screen.calc(55), height: screen.calc(55)),
                    )
                  : GestureDetector(
                      onTap: onHeart,
                      child: Image.asset('assets/icon_heart_w.png',
                          width: screen.calc(55), height: screen.calc(55)),
                    )),
          Center(
            // 定义是否可以下载
            child: ImgButton(
              'assets/icon_download_w.png',
              onTap: onDownload,
              width: screen.calc(55),
              height: screen.calc(55),
            ),
          ),
          Center(
            child: ImgButton(
              'assets/icon_bell_w.png',
              onTap: onBell,
              width: screen.calc(55),
              height: screen.calc(55),
            ),
          ),
          Center(
            child: Image.asset('assets/icon_message_w.png',
                width: screen.calc(55), height: screen.calc(55)),
          ),
          Center(
              child: ImgButton('assets/icon_3dots_w.png',
                  onTap: onSetting,
                  width: screen.calc(55),
                  height: screen.calc(55))),
        ],
      ),
    );
  }
}
