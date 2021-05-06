import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/playing.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
      height: screen.calc(72),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: Image.asset(
              'assets/icon_left_arrow.png',
              width: screen.calc(40),
              height: screen.calc(40),
            )),
          ),
          Expanded(
              child: Center(
            child: Text(
              '歌单广场',
              style: TextStyle(
                  fontSize: screen.calc(34), fontWeight: FontWeight.w700),
            ),
          )),
          Container(
            child: Playing(),
          )
        ],
      ),
    );
  }
}
