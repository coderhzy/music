import 'package:music/util/system_util.dart';
import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/pages/home/header.dart';
import 'package:music/pages/home/banner.dart';
import 'package:music/pages/home/category.dart';
import 'package:music/widgets/song_list.dart';
import 'package:music/widgets/recommend_list.dart';
import 'package:music/widgets/global_bottom_navigation_bar.dart';
import 'package:audioplayers/audioplayers.dart';

const recommendList1 = [
  {
    'id': '1111',
    'img': 'assets/tmp_cover_1.jpg',
    'title': 'Tempest',
    'artist': 'Capo Productions',
    'tip': '你到不了的地方 音乐能带你去'
  },
  {
    'id': '1111',
    'img': 'assets/tmp_cover_2.jpg',
    'title': '岁月神偷',
    'artist': '金玟岐',
    'tip': 'aaa'
  },
  {
    'id': '1111',
    'img': 'assets/tmp_cover_3.jpg',
    'title': '最美的期待',
    'artist': '周笔畅',
    'tip': 'bbb'
  },
  {
    'id': '1111',
    'img': 'assets/tmp_cover_4.jpg',
    'title': '遥远的你',
    'artist': 'xxxx',
    'tip': 'xxx'
  },
  {
    'id': '1111',
    'img': 'assets/tmp_cover_5.jpg',
    'title': '遥远的你',
    'artist': 'xxxx',
    'tip': 'xxx'
  },
  {
    'id': '1111',
    'img': 'assets/tmp_cover_6.jpg',
    'title': '遥远的你',
    'artist': 'xxxx',
    'tip': 'xxx'
  },
];

const songList1 = [
  {
    'id': '43423',
    'img': 'assets/tmp_cover_1.jpg',
    'count': '9亿',
    'title': '[华语新歌] 最新华语音乐专辑|最快最多最好最什么'
  },
  {
    'id': '666',
    'img': 'assets/tmp_cover_2.jpg',
    'count': '39.4亿',
    'title': '今天从《Titan》听起|私人雷达'
  },
  {
    'id': '231',
    'img': 'assets/tmp_cover_3.jpg',
    'count': '16亿',
    'title': 'aaa'
  },
  {
    'id': '333',
    'img': 'assets/tmp_cover_4.jpg',
    'count': '5321',
    'title': 'bbb'
  },
  {
    'id': '788',
    'img': 'assets/tmp_cover_5.jpg',
    'count': '19万',
    'title': 'ccc'
  },
  {
    'id': '344',
    'img': 'assets/tmp_cover_6.jpg',
    'count': '565',
    'title': 'dddd'
  },
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    /// 判断Android去除最上方栏
    setStatusBarStyle(Brightness.light);

    return Scaffold(
      body: DefaultTextStyle(
        // 全局默认字体
        style: TextStyle(color: Color(0xff333333)),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(top: screen.top + screen.calc(7)),
            child: Column(
              children: [
                Header(),
                MyBanner(),
                CateGory(),
                SongList(
                  title: '你的歌单精选站',
                  onMore: () {
                    Navigator.pushNamed(context, '/square');
                  },
                  items: songList1,
                ),
                RecommendListPage(
                  title: '根据 Red Down （a）推荐',
                  items: recommendList1,
                  onMore: () {
                    print('more');
                  },
                  onPlay: (id) {
                    print('play:$id');
                  },
                ),
                Container(
                  height: screen.calc(100),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GlobalBottomNavigationBar(
        /// 完成换页操作
        value: 0,
      ),
    );
  }
}

/// 测试获取音乐
///
// FlatButton(
// onPressed: () async {
// var player = getPlayer();
// int res = await player.play(
// 'https://codehzy.cn/pname/flutter/music/music_1.mp3');
//
// if (res == 1) {
// print('play success');
// }
// },
// child: Text('播放'),
// color: Colors.red,
// ),

/// 测试停止音乐
// FlatButton(
//   onPressed: () async {
//     var player = getPlayer();
//     var res = await player.stop();
//
//     if (res == 1) {
//       print('成功停止');
//     }
//   },
//   child: Text('停止播放'),
//   color: Colors.red,
// ),
