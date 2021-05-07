import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      height: screen.calc(98),
      child: Row(
        children: [
          GestureDetector(
            /// 播放页左上返回
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Image.asset(
                'assets/icon_left_w.png',
                width: screen.calc(66),
                height: screen.calc(64),
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: screen.calc(14)),
            child: Column(
              children: [
                Text(
                  'Somewhere Only We Know',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screen.calc(30),
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screen.calc(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Keane',
                        style: TextStyle(color: Color(0x99ffffff)),
                      ),
                      Image.asset(
                        'assets/icon_right_w.png',
                        width: screen.calc(20),
                        height: screen.calc(20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
          Container(
            child: Image.asset(
              'assets/icon_share_w.png',
              width: screen.calc(50),
              height: screen.calc(50),
            ),
          )
        ],
      ),
    );
  }
}
