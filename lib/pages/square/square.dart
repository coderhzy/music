import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/global_bottom_navigation_bar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 广场页
import 'package:music/pages/square/header.dart';
import 'package:music/pages/square/category.dart';
import 'package:music/pages/square/banner_slider.dart';
import 'package:music/pages/square/square_list.dart';

/// 广场页栏目数据
final items = [
  {'id': 0, 'title': '推荐', 'color': null},
  {'id': 1, 'title': '官方', 'color': null},
  {'id': 2, 'title': '精品', 'color': 0xffe7aa5a},
  {'id': 3, 'title': '欧美', 'color': null},
  {'id': 4, 'title': '电子', 'color': null},
  {'id': 5, 'title': '流行', 'color': null},
  {'id': 6, 'title': '云村', 'color': null},
  {'id': 7, 'title': '地球', 'color': null},
  {'id': 8, 'title': '网易', 'color': null},
  {'id': 9, 'title': '歌单', 'color': null},
  {'id': 10, 'title': '其他', 'color': null},
];

class SquarePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    // 得到route对象
    final args = ModalRoute.of(context).settings.arguments as Map;

    /// 变更状态
    final categoryID = useState(items[0]['id']);

    print(args);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: screen.top + screen.calc(7)),
        child: Column(
          children: [
            Header(),
            Category(
              /// 广场页父级元素传递
              items: items,
              value: categoryID.value,
              onChanged: (id) {
                categoryID.value = id;
              },
            ),
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
