import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class SquareList extends StatelessWidget {
  /// 父级传参过来，数据在square中
  final List<Map> items;

  const SquareList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final rows = [];

    /// 遍历item  +3 显示ROW方向图片
    for (var i = 0; i < items.length; i += 3) {
      rows.add(items.sublist(i, i + 3));
    }

    return Container(
      margin: EdgeInsets.only(top: screen.calc(2)),
      padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
      child: Column(

          /// 遍历rows
          children: rows
              .map<Widget>((row) => Container(
                    margin: EdgeInsets.only(top: screen.calc(36)),
                    child: Row(
                      /// flex布局 均分中间
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: row
                          .map<Widget>(
                            (item) => Container(
                                width: screen.calc(214),
                                height: screen.calc(300),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      item['img'],
                                      width: screen.calc(214),
                                      height: screen.calc(214),

                                      /// 图片铺满
                                      fit: BoxFit.fill,
                                    ),
                                    Container(
                                      child: Text(
                                        item['title'],
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: screen.calc(24)),
                                      ),
                                    )
                                  ],
                                )),
                          )
                          .toList(),
                    ),
                  ))
              .toList()),
    );
  }
}
