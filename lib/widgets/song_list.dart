import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class SongList extends StatelessWidget {
  // 列表参数
  final String title;
  final VoidCallback onMore;
  final List<Map> items;

  // item父级传参items过来
  SongList({Key key, this.title, this.onMore, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: screen.calc(58)),
        padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
        child: Column(
          children: [
            Row(
              children: [
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: screen.calc(34), fontWeight: FontWeight.w700),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  // 点击查看更多动作事件
                  onTap: onMore,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: screen.calc(24), right: screen.calc(24)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffe6e6e6), width: screen.calc(2)),
                          borderRadius:
                              BorderRadius.circular(screen.calc(52 / 2))),
                      height: screen.calc(52),
                      child: Center(
                        child: Text('查看更多'),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(24)),
              padding: EdgeInsets.only(
                  left: screen.calc(22), right: screen.calc(22)),
            )
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(top: screen.calc(24)),
          padding:
              EdgeInsets.only(left: screen.calc(22), right: screen.calc(22)),
          child: Row(
              children: items
                  .map((item) => Container(
                        width: screen.calc(209),
                        margin: EdgeInsets.only(
                            left: screen.calc(10), right: screen.calc(10)),
                        child: Column(
                          children: [
                            Container(
                              width: screen.calc(209),
                              height: screen.calc(209),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(item['img']),
                                      // 图片铺满框
                                      fit: BoxFit.fill),
                                  borderRadius:
                                      BorderRadius.circular(screen.calc(10))),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: screen.calc(12)),
                                height: screen.calc(64),
                                child: Center(
                                  child: Text(
                                    item['title'],
                                    style: TextStyle(
                                      fontSize: screen.calc(24),
                                    ),
                                    // 文字过多....显示
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ))
                          ],
                        ),
                      ))
                  .toList()),
        ),
      ),
    ]);
  }
}
