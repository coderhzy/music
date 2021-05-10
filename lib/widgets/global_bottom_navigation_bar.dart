import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music/util/screen_util.dart';



/// 循环显示底部导航栏
const navigationItems = [
  {
    'img': 'assets/icon_Music_disc_b.png',
    'activeImg': 'assets/icon_Music_disc.png',
    'title': '发现',
  },
  {
    'img': 'assets/icon_video_b.png',
    'activeImg': 'assets/icon_video.png',
    'title': '视频',
  },  {
    'img': 'assets/icon_music_b.png',
    'activeImg': 'assets/icon_music.png',
    'title': '我的',
  },  {
    'img': 'assets/icon_group_b.png',
    'activeImg': 'assets/icon_group.png',
    'title': '云村',
  }, {
    'img': 'assets/icon_person_b.png',
    'activeImg': 'assets/icon_person.png',
    'title': '账号',
  },

];


typedef NavigationBarCallback = void Function(int);

class GlobalBottomNavigationBar extends HookWidget {
  final int value;

  const GlobalBottomNavigationBar({Key key, this.value = 0, })
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Hero(
      /// 1. 使用Hero来去掉页面改变的动画
      tag: '_bottom_nav_bar_1',
      child: DefaultTextStyle(
        /// 2. 让文字不继承TextStyle
        style: TextStyle(inherit: false),
        child: Container(
          padding: EdgeInsets.only(top: screen.calc(10)),
          height: screen.calc(98),
          decoration: BoxDecoration(color: Color(0x66ffff)),
          child: Row(
            /// 主轴对齐,flex布局,将剩余空间的距离分配给东西的两边
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navigationItems.asMap().map((index,item) =>MapEntry(index, NavigationBarItem(
              img: item['img'],
              activeImg: item['activeImg'],
              title: item['title'],
              active: value == index,
              /// 底部导航栏切换功能
              onTap: (){
                switch(index){
                  case 0:
                    Navigator.pushNamed(context, '/home');
                    break;
                  case 2:
                    Navigator.pushNamed(context, '/square');
                    break;
                  case 4:
                    Navigator.pushNamed(context, '/login');
                }
              },
            ))).values.toList(),
          ),
        ),
      ),
    );
  }
}

/// 底部导航栏图标显示,分离组件
class NavigationBarItem extends StatelessWidget {
  final String img;
  final String activeImg;
  final String title;
  final bool active;
  final VoidCallback onTap;

  const NavigationBarItem({
    Key key,
    this.img,
    this.activeImg,
    this.title,
    this.active = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              width: screen.calc(56),
              height: screen.calc(56),
              decoration: BoxDecoration(
                gradient: active
                    ? LinearGradient(
                        colors: [
                            Color(0xffff584a),
                            Color(0xffff1f14),
                          ],

                        /// 渐变方向
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight)
                    : null,
                borderRadius: BorderRadius.circular(screen.calc(28)),
              ),
              child: Center(
                child: Image.asset(
                  /// 控制显示是否选中导航栏的样式图标
                  active ? activeImg : img,
                  width: screen.calc(30),
                  height: screen.calc(30),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: screen.calc(17),
                color: active ? Color(0xffff1f14) : Color(0xff969696),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class GlobalBottomNavigationBar extends HookWidget {
//   const GlobalBottomNavigationBar({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(items: [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.play_arrow),
//         title: Text('发现'),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.play_arrow),
//         title: Text('发现'),
//       ),
//     ]);
//   }
// }
