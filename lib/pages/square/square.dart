import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('歌单广场'),
      ),
    );
  }
}
