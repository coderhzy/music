import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

typedef fnChanged = void Function(int);

class Category extends StatelessWidget {
  final int value; // 当前id
  final fnChanged onChanged;
  final List<Map> items;

  const Category({Key key, this.value = 0, this.onChanged, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Container(
      margin: EdgeInsets.only(top: screen.calc(30)),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color(0xffbcbab9), width: screen.calc(1)))),
      child: SingleChildScrollView(
        /// 横向滚动
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(left: screen.calc(2), right: screen.calc(2)),
          child: Row(
            children: items
                .map((item) => GestureDetector(
                      onTap: () {
                        onChanged(item['id']);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: (value == item['id'])
                              ? screen.calc(23 - 4.0)
                              : screen.calc(23),
                        ),
                        margin: EdgeInsets.only(
                            left: screen.calc(18), right: screen.calc(18)),
                        alignment: Alignment.topCenter,
                        width: screen.calc(83),
                        decoration: BoxDecoration(
                            border: (value == item['id'])
                                ? Border(
                                    bottom: BorderSide(
                                        color: Color(0xffff3a3a),
                                        width: screen.calc(4)))
                                : null),

                        /// padding是占据高度的,所以要在高度加上
                        child: Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: screen.calc(28),
                            fontWeight: FontWeight.w700,

                            /// 控制选中颜色，未选中颜色以及默认颜色
                            color: (value == item['id'])
                                ? Color(0xffff3a3a)
                                : (item['color'] != null
                                    ? Color(item['color'])
                                    : Color(0xff2b2b2b)),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
