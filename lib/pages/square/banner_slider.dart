import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(38)),
      child: Text('banner'),
    );
  }
}
