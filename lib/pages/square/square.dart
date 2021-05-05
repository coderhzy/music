import 'package:flutter/material.dart';
import 'package:music/widgets/global_bottom_navigation_bar.dart';

class SquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 得到route对象
    var args = ModalRoute.of(context).settings.arguments as Map;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('广场'),
      ),
      body: Container(
        child: Center(
          child: Text('歌单广场'),
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(
        /// 完成换页操作
        value: 2,
      ),
    );
  }
}
