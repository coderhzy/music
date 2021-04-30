import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// main -> runApp入口
void main() {
  runApp(MyApp());
}

/// StatelessWidget无状态组件，使用build在构建视图。组件被使用，会调用build方法。
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '我的第一个app',
        home: Scaffold(
            appBar: AppBar(
              title: Text('首页'),
            ),
            body: Center(
              child: Column(
                children: [
                  Cmp1(),
                  Cmp2(),
                  Cmp3(),
                ],
              ),
            )));
  }
}

/// 变了不更新，因为是StatelessWidget，无状态
class Cmp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var a = 0;

    return Row(
      children: [
        Text('a=$a'),
        TextButton(
          onPressed: () {
            a++;
            print(a);
          },
          child: Text('按钮'),
        )
      ],
    );
  }
}

/// 有状态 所以更新，StatefulWidget返回组件，有状态
class _Cmp2State extends State {
  var a = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('a=$a'),
        TextButton(
          onPressed: () {
            setState(() {
              a++;
              print(a);
            });
          },
          child: Text('按钮'),
        )
      ],
    );
  }
}

class Cmp2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Cmp2State();
  }
}

/// hooks
class Cmp3 extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var a = useState<int>(0);

    return Row(
      children: [
        Text('a=${a.value}'),
        FlatButton(
          onPressed: () {
            a.value++;
          },
          child: Text('++'),
          color: Colors.red,
        )
      ],
    );
  }
}
