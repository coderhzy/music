import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('开屏页'),),
      body: RaisedButton(
        color: Colors.blue,
        child: Text('跳转到首页'),
        onPressed: () {
          // 跳转到首页,使用pushReplacementNamed没有历史，有返回用push
          Navigator.pushReplacementNamed(context, '/home');
        },
      )
    );
  }
}