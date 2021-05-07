import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

const iconItem = [
  {'id': 1, 'img': 'assets/icon_heart_w.png'},
  {'id': 2, 'img': 'assets/icon_download_w.png'},
  {'id': 3, 'img': 'assets/icon_bell_w.png'},
  {'id': 4, 'img': 'assets/icon_message_w.png'},
  {'id': 5, 'img': 'assets/icon_3dots_w.png'},
];

class ControlPageOne extends StatelessWidget {
  const ControlPageOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      height: screen.calc(55),
      margin: EdgeInsets.only(bottom: screen.calc(14)),
      padding: EdgeInsets.only(left: screen.calc(24), right: screen.calc(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: iconItem
            .map((item) => Container(
                  child: Image.asset(item['img']),
                  width: screen.calc(55),
                  height: screen.calc(55),
                ))
            .toList(),
      ),
    );
  }
}
