import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/img_button.dart';

class ControlPageSecond extends StatelessWidget {
  final VoidCallback onBackward;
  final VoidCallback onForward;
  final VoidCallback onPlaylist;
  final VoidCallback onPlayTap;
  final VoidCallback onPauseTap;
  final bool playing;

  ControlPageSecond(
      {Key key,
      this.onBackward,
      this.onForward,
      this.onPlaylist,
      this.onPlayTap,
      this.onPauseTap,
      this.playing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Container(
      margin: EdgeInsets.only(bottom: screen.calc(32), top: screen.calc(14)),
      height: screen.calc(120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image.asset('assets/icon-playloop-w.png',
                width: screen.calc(55), height: screen.calc(55)),
          ),
          Center(
            child: ImgButton('assets/icon-backward-w.png',
                onTap: onBackward,
                width: screen.calc(55),
                height: screen.calc(55)),
          ),
          Container(
            height: screen.calc(120),
            width: screen.calc(120),
            decoration: BoxDecoration(
                border: Border.all(width: screen.calc(2), color: Colors.white),
                borderRadius: BorderRadius.circular(screen.calc(60))),
            child: Center(
              child: playing
                  ? GestureDetector(
                      onTap: onPauseTap,
                      child: Image.asset('assets/icon-pause-w.png',
                          width: screen.calc(55), height: screen.calc(55)),
                    )
                  : GestureDetector(
                      onTap: onPlayTap,
                      child: Image.asset('assets/icon-play-w.png',
                          width: screen.calc(55), height: screen.calc(55))),
            ),
          ),
          Center(
            child: ImgButton('assets/icon-forward-w.png',
                onTap: onForward,
                width: screen.calc(55),
                height: screen.calc(55)),
          ),
          Center(
            child: ImgButton('assets/icon-playlist-w.png',
                onTap: onPlaylist,
                width: screen.calc(55),
                height: screen.calc(55)),
          ),
        ],
      ),
    );
  }
}
