import 'package:music/util/screen_util.dart';
import 'package:flutter/material.dart';

void showPlayInfo(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(.5),
      barrierDismissible: false,
      transitionDuration: Duration(microseconds: 300),
      pageBuilder: (context, animaOne, animaTwo) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: _PlayInfo(),
              )
            ],
          ),
        );
      });
}

class _PlayInfo extends StatelessWidget {
  const _PlayInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Container(
      height: screen.height * .75,
      width: screen.width,
      padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
      decoration: BoxDecoration(
          color: Color(0xfff5f5f5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screen.calc(40)),
              topRight: Radius.circular(screen.calc(40)))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            Container(height: screen.calc(45)),
            _List(),
            Container(height: screen.calc(16)),
            _List(),
            Container(height: screen.calc(16)),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

/// 弹出框2: 头部
class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Padding(
      padding: EdgeInsets.only(top: screen.calc(40)),
      child: Column(
        children: [
          /// header上方开通VIP畅享
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Somewhere Only We Know',
                  style: TextStyle(
                      fontSize: screen.calc(24), fontWeight: FontWeight.w700),
                ),
                Padding(
                    padding: EdgeInsets.only(top: screen.calc(10)),
                    child: Text(
                      '开通VIP畅享千万曲库下载特权',
                      style: TextStyle(
                        fontSize: screen.calc(24),
                        color: Color(0xff959595),
                      ),
                    ))
              ]),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('vip');
                },
                child: Container(
                  width: screen.calc(182),
                  height: screen.calc(52),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffea6a65), width: screen.calc(2)),
                    borderRadius: BorderRadius.circular(screen.calc(26)),
                  ),
                  child: Center(
                    child: Text(
                      '开通VIP畅享',
                      style: TextStyle(
                          color: Color(0xffea6a65),
                          fontSize: screen.calc(22),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// 下方收藏 音质自动滚动区域
          Padding(
            padding: EdgeInsets.only(top: screen.calc(44)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _HeaderBtn(title: '收藏', icon: Icon(Icons.create_new_folder)),
                _HeaderBtn(title: '音质:自动', icon: Icon(Icons.music_note)),
                _HeaderBtn(title: '鲸云音效', icon: Icon(Icons.save)),
                _HeaderBtn(title: '相似推荐', icon: Icon(Icons.adjust)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// 弹出框2：头部按钮
class _HeaderBtn extends StatelessWidget {
  final String title;
  final Icon icon;

  const _HeaderBtn({Key key, this.title = '', this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Column(
      children: [
        Container(
          width: screen.calc(120),
          height: screen.calc(120),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screen.calc(60))),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.only(top: screen.calc(19)),
          child: Text(title),
        )
      ],
    );
  }
}

/// 弹出框2：中间List
class _List extends StatelessWidget {
  const _List({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Text('list');
  }
}

/// 弹出框2: _Footer
class _Footer extends StatelessWidget {
  const _Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Text('footer');
  }
}
