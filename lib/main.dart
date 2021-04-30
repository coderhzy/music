import 'package:flutter/material.dart';

/// main -> runApp入口
void main() {
  runApp(MyApp());
}

/// StatelessWidget无状态组件，使用build在构建视图。组件被使用，会调用build方法。
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的第一个app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: Column(
          children: [
            Text('你好'),
            Text('hello world'),
          ],
        )
      ),
    );
  }
}