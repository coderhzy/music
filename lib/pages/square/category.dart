import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class Category extends StatelessWidget {
  const Category({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(30)),
      child: Text('category'),
    );
  }
}
