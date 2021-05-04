import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/pages/home/header.dart';
import 'package:music/pages/home/banner.dart';
import 'package:music/pages/home/category.dart';
import 'package:music/widgets/song_list.dart';
import 'package:music/widgets/recommend_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Screen(context);

    return Scaffold(
      body: DefaultTextStyle(
        // 全局默认字体
        style: TextStyle(color: Color(0xff333333)),
        child: SingleChildScrollView(
          child: Container(
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
                    items: [
                      {
                        'id': '1',
                        'img': 'assets/tmp_cover_1.jpg',
                        'count': '9亿',
                        'title': '[华语新歌]最新华宇音乐专辑|最酷，最快，最多，最好，最真'
                      },
                      {
                        'id': '2',
                        'img': 'assets/tmp_cover_2.jpg',
                        'count': '39亿',
                        'title': '[从你的]全世界路过'
                      },
                      {
                        'id': '3',
                        'img': 'assets/tmp_cover_3.jpg',
                        'count': '99.2亿',
                        'title': '[那些年]错过的大雨'
                      },
                      {
                        'id': '4',
                        'img': 'assets/tmp_cover_4.jpg',
                        'count': '14223',
                        'title': '[华语新歌]最新华晨宇新歌'
                      },
                      {
                        'id': '5',
                        'img': 'assets/tmp_cover_5.jpg',
                        'count': '323亿',
                        'title': '[华语新歌]李宇春新歌'
                      },
                      {
                        'id': '6',
                        'img': 'assets/tmp_cover_6.jpg',
                        'count': '19万',
                        'title': '[华语新歌]精选周杰伦'
                      },
                    ]),
                RecommendListPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
