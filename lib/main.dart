import 'package:music/util/system_util.dart';
import 'package:flutter/material.dart';
import 'package:music/router.dart';
import 'package:music/util/play_state.dart';

/// main -> runApp入口
void main() {
  runApp(PlayStateProvider(
    child: App(),
  ));

  /// 判断Android去除最上方栏
  setStatusBarStyle(Brightness.light);
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
