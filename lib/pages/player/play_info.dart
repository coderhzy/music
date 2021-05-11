import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

const list1Items=[
  {'icon': Icons.person, 'text': '歌手：Keane(基音乐队)'},
  {'icon': Icons.disc_full, 'text': '专辑：Somewhere Only We Know'},
  {'icon': Icons.link, 'text': '来源：歌单「钢琴摇滚 | 浪子赠予xxx的xxx」'},
  {'icon': Icons.videocam, 'text': '相关视频'},
];

const list2Items=[
  {'icon': Icons.cloud, 'text': '云贝推歌(已有12人推荐)'},
  {'icon': Icons.shopping_cart, 'text': '单曲购买'},
  {'icon': Icons.rate_review, 'text': '评分：4.95分 (12人已评)'},
  {'icon': Icons.add, 'text': '加入到我的歌单'},
];


void showPlayInfo(BuildContext context){
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(.5),
    barrierDismissible: false,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, a1, a2){
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
    },
  );
}

class _PlayInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.height*.75,
      width: screen.width,
      padding: EdgeInsets.only(
        left: screen.calc(32),
        right: screen.calc(32),
        top: screen.calc(40)
      ),
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screen.calc(40)),
          topRight: Radius.circular(screen.calc(40)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            Container(height: screen.calc(45)),
            _List(items: list1Items),
            Container(height: screen.calc(16)),
            _List(items: list2Items),
            Container(height: screen.calc(16)),
            _Footer(),
            Container(height: screen.calc(40)),
          ],
        ),
      ),
    );
  }
}



class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Somewhere Only We Know',
                    style: TextStyle(
                        fontSize: screen.calc(24),
                        fontWeight: FontWeight.w700
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: screen.calc(10)),
                  child: Text(
                      '开通VIP畅享千万曲库下载特权',
                      style: TextStyle(
                        fontSize: screen.calc(24),
                        color: Color(0xff959595),
                      )
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
              },
              child: Container(
                width: screen.calc(182),
                height: screen.calc(52),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffea6a65), width: screen.calc(2)),
                  borderRadius: BorderRadius.circular(screen.calc(26)),
                ),
                child: Center(
                    child: Text(
                        '开通VIP畅享',
                        style: TextStyle(
                          color: Color(0xffea6a65),
                          fontSize: screen.calc(22),
                          fontWeight: FontWeight.w700,
                        )
                    )
                ),
              ),
            ),
          ],
        ),
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
            )
        ),
      ],
    );
  }
}
class _HeaderBtn extends StatelessWidget{
  final String title;
  final Icon icon;

  _HeaderBtn({Key key, this.title='', this.icon}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    return Column(
      children: [
        Container(
          width: screen.calc(120),
          height: screen.calc(120),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screen.calc(60)),
          ),
          child: icon,
        ),
        Padding(
          padding: EdgeInsets.only(top: screen.calc(19)),
          child: Text(title),
        ),
      ],
    );
  }
}



class _List extends StatelessWidget{
  final List<Map> items;

  _List({Key key, this.items}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final items=this.items!=null?this.items:[];

    return Container(
      width: screen.calc(686),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screen.calc(20)),
      ),
      child: Column(
        children: items.map((item) => _ListItem(
          icon: item['icon'],
          title: item['text'],
        )).toList()
      ),
    );
  }
}
class _ListItem extends StatelessWidget{
  final icon;
  final title;

  _ListItem({Key key, this.icon, this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.calc(99),
      child: Row(
        children: [
          Container(
            width: screen.calc(108),
            child: Icon(icon),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: screen.calc(66)),
              height: screen.calc(99),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: Color(0xffe6e6e6),
                )),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: screen.calc(32),
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}



class _Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        width: screen.calc(686),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screen.calc(20)),
        ),
        child: Container(
          padding: EdgeInsets.only(right: screen.calc(66)),
          height: screen.calc(99),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              '关闭',
              style: TextStyle(
                fontSize: screen.calc(32),
              ),
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            )
          ),
        ),
      )
    );
  }
}








