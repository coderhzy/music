import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/global_bottom_navigation_bar.dart';

/// 广场页
import 'package:music/pages/square/header.dart';
import 'package:music/pages/square/category.dart';
import 'package:music/pages/square/banner_slider.dart';
import 'package:music/pages/square/square_list.dart';

class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    // 得到route对象
    var args = ModalRoute.of(context).settings.arguments as Map;
    print(args);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top + screen.calc(7)),
        child: Column(
          children: [
            Header(),
            Category(),
            BannerSlider(),
            SquareList(),
          ],
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(
        /// 完成换页操作
        value: 2,
      ),
    );
  }
}
