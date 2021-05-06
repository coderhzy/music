import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// prev = (n - 1 + 10) % 10   , cur = n , next = (n + 1) % 10;

var items = [
  {'index': 0, 'title': '111'},
  {'index': 1, 'title': '222'},
  {'index': 2, 'title': '333'},
  {'index': 3, 'title': '444'},
  {'index': 4, 'title': '555'},
  {'index': 5, 'title': '666'},
  {'index': 6, 'title': '777'},
];

class BannerSlider extends HookWidget {
  const BannerSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final _value = useState(0);

    /// prev &  cur & next 对应的信息，具体看本文件最上方
    final prev = (_value.value - 1 + items.length) % items.length,
        cur = _value.value,
        next = (_value.value + 1) % items.length;

    final W = screen.calc(344.0),
        H = screen.calc(438.0),
        offsetH = screen.calc(200),
        offsetV = 20.0;

    /// prevRect & curRect & nextRect & otherRect 位置信息
    Rect prevRect = Rect.fromLTWH(
            (screen.width - W * 0.8) / 2 - offsetH, offsetV, W * .8, H * .8),
        curRect = Rect.fromLTWH((screen.width - W) / 2, 0, W, H),
        nextRect = Rect.fromLTWH(
            (screen.width - W * 0.8) / 2 + offsetH, offsetV, W * .8, H * .8),
        otherRect = Rect.fromLTWH((screen.width - W) / 2, 0, W, H);

    /// prev & cur & next & other 透明度
    double prevOpacity = 0.5,
        curOpacity = 1.0,
        nextOpacity = 0.5,
        otherOpacity = 0.0;

    /// 根据透明度来排序item数组
    items.sort((item1, item2) {
      double opacity1, opacity2;

      if (item1['index'] == prev)
        opacity1 = prevOpacity;
      else if (item1['index'] == cur)
        opacity1 = curOpacity;
      else if (item1['index'] == next)
        opacity1 = nextOpacity;
      else
        opacity1 = otherOpacity;

      if (item2['index'] == prev)
        opacity2 = prevOpacity;
      else if (item2['index'] == cur)
        opacity2 = curOpacity;
      else if (item2['index'] == next)
        opacity2 = nextOpacity;
      else
        opacity2 = otherOpacity;

      /// opacity从小到大排序
      if (opacity1 < opacity2)
        return 1;
      else if (opacity1 > opacity2) return -1;
      return 0;
    });

    print(items);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(38)),
      width: screen.width,
      height: 200,
      child: Stack(
        /// map数据item生成Positioned组件
        children: items.map((item) {
          Rect rect;
          double opacity;
          int index = item['index'];

          /// 在排序后的数组中进行判断index等于哪个位置，再将其设置opacity(透明度)和curRect(位置信息)
          if (index == cur) {
            rect = curRect;
            opacity = curOpacity;
          } else if (index == prev) {
            rect = prevRect;
            opacity = prevOpacity;
          } else if (index == next) {
            rect = nextRect;
            opacity = nextOpacity;
          } else {
            rect = otherRect;
            opacity = otherOpacity;
          }

          return Positioned(
            left: rect.left,
            top: rect.top,
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: rect.width,
                height: rect.height,
                decoration: BoxDecoration(color: Colors.yellow),
                child: Center(
                    child: Text(
                  item['title'],
                  style: TextStyle(fontSize: 40),
                )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// 1. 对item数组的opacity进行从小到大排序
// 2. 在排序后的数组中进行判断index等于哪个位置，再将其设置opacity(透明度)和curRect(位置信息)
// 3. 根据item数组遍历生成Positioned，使用Rect,prevRect,curRect,nextRect,otherRect来控制位置
