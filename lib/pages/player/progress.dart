import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class ProgressPage extends StatelessWidget {
  final int current;
  final int total;

  const ProgressPage({Key key, this.current, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final W = 558.0;

    //左侧字
    final curTime = current == null
        ? '--:--'
        : '${(current ~/ 60).toString().padLeft(2, '0')}:${(current % 60).toString().padLeft(2, '0')}';

    //右侧字
    final totalTime = total == null
        ? '--:--'
        : '${(total ~/ 60).toString().padLeft(2, '0')}:${(total % 60).toString().padLeft(2, '0')}';

    //小球，此处double类型有坑
    double curWidth = (current == null || total == null || total == 0)
        ? 0
        : screen.calc((W - 18) * current / total);

    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: screen.calc(50)),
      height: screen.calc(30),
      child: DefaultTextStyle(
        style: TextStyle(
            color: Colors.white.withOpacity(0.6), fontSize: screen.calc(28)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: screen.calc(28)),
                child: Text(curTime)),
            Expanded(
              child: Container(
                height: screen.calc(30),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: screen.calc(W),
                        margin: EdgeInsets.only(
                            left: screen.calc(9), right: screen.calc(9)),
                        height: screen.calc(4),
                        color: Colors.white.withOpacity(.6),
                        child: Stack(
                          children: [
                            Container(
                              width: curWidth,
                              color: Colors.white.withOpacity(.8),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      /// 移动小球位置
                      left: curWidth,
                      top: screen.calc(6),
                      child: Container(
                        width: screen.calc(16),
                        height: screen.calc(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            screen.calc(16),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: screen.calc(18), right: screen.calc(28)),
                child: Text(totalTime))
          ],
        ),
      ),
    );
  }
}
