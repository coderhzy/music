import 'package:flutter/material.dart';
import 'package:music/router.dart';

/// main -> runApp入口
void main() {
  runApp(App());
}

/// StatelessWidget无状态组件，使用build在构建视图。组件被使用，会调用build方法。
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my first flutter',
      routes: routes,
      initialRoute: '/',
    );
  }
}
