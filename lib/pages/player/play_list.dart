import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

const activeID='5';

const items=[
  {'id': '1', 'title': 'Changes', 'artist': 'Jack Savotti'},
  {'id': '2', 'title': 'Beautiful Disaster', 'artist': 'Jon McLaughlin'},
  {'id': '3', 'title': 'Changes', 'artist': 'Jack Savotti'},

  {'id': '4', 'title': 'Changes', 'artist': 'Jack Savotti'},
  {'id': '5', 'title': 'Beautiful Disaster', 'artist': 'Jon McLaughlin'},
  {'id': '6', 'title': 'Changes', 'artist': 'Jack Savotti'},

  {'id': '7', 'title': 'Changes', 'artist': 'Jack Savotti'},
  {'id': '8', 'title': 'Beautiful Disaster', 'artist': 'Jon McLaughlin'},
  {'id': '9', 'title': 'Changes', 'artist': 'Jack Savotti'},

  {'id': '10', 'title': 'Changes', 'artist': 'Jack Savotti'},
  {'id': '11', 'title': 'Beautiful Disaster', 'artist': 'Jon McLaughlin'},
  {'id': '12', 'title': 'Changes', 'artist': 'Jack Savotti'},

  {'id': '13', 'title': 'Changes', 'artist': 'Jack Savotti'},
  {'id': '14', 'title': 'Beautiful Disaster', 'artist': 'Jon McLaughlin'},
  {'id': '15', 'title': 'Changes', 'artist': 'Jack Savotti'},
];

void showPlayList(BuildContext context){
  final screen=Screen(context);
  final borderColor=Color(0xffe6e6e6);

  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(.3),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, a1, a2){
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              bottom: screen.calc(52),
              left: screen.calc(30),
              child: Container(
                width: screen.calc(690),
                height: screen.calc(908),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screen.calc(46)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    _Header(),
                    _List(),
                    _Footer(),
                  ],
                ),
              )
            )
          ],
        )
      );
    },
  );
}

class _Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32), bottom: screen.calc(18)),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: screen.calc(38)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: '当前播放',
                              style: TextStyle(
                                fontSize: screen.calc(36),
                                fontWeight: FontWeight.w700
                              )
                            ),
                            TextSpan(text: ' (85)', style: TextStyle(fontSize: screen.calc(32), color: Color(0xff999999))),
                          ]
                      ),
                    )
                  ]
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: screen.calc(26)),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.loop),
                      Text('列表循环')
                    ],
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: screen.calc(32)),
                      child: Row(
                        children: [
                          Icon(Icons.create_new_folder, color: Color(0xff999999)),
                          Text('收藏全部')
                        ],
                      )
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(width: 1, color: Color(0xffe6e6e6))),
                    ),
                    padding: EdgeInsets.only(left: screen.calc(30)),
                    child: Icon(Icons.delete, color: Color(0xff999999)),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final borderColor=Color(0xffe6e6e6);

    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: screen.calc(111),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: borderColor, width: 1)),
          ),
          child: Center(
              child: Text('关闭', style: TextStyle(fontSize: screen.calc(32)))
          ),
        )
    );
  }
}

class _List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
          child: Column(
            children: items.map((item)=>
              _ListItem(
                title: item['title'],
                artist: item['artist'],
                active: activeID==item['id'],
              )
            ).toList(),
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget{
  final String title;
  final String artist;
  final bool active;

  _ListItem({Key key, this.title, this.artist, this.active=false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Container(
      height: screen.calc(89),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffe6e6e6))),
      ),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: screen.calc(26),
                    color: active?Color(0xffeb534c):Color(0xff333333),
                  )
                ),
                TextSpan(
                  text: ' - $artist',
                  style: TextStyle(
                    color: active?Color(0xffeb534c):Color(0xff666666),
                    fontSize: screen.calc(22)
                  )
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(Icons.close, color: Color(0xff999999)),
        ],
      )
    );
  }
}



