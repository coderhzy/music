import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/pages/home/header.dart';
import 'package:music/pages/home/banner.dart';
import 'package:music/pages/home/category.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Screen(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top + screen.calc(7)),
        child: Column(
          children: [Header(), MyBanner(), CateGory()],
        ),
      ),
    );
  }
}
