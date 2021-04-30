import 'package:flutter/material.dart';

/// main -> runApp入口
void main() {
  runApp(MyApp());
}

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