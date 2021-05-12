import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class Header extends StatelessWidget{
  final String title;

  Header({Key key, this.title}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Hero(
      tag: '_login_super_hero',
      child: Container(
        height: screen.calc(88),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: screen.calc(100),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            Expanded(
                child: Center(
                    child: Text(
                        title,
                        style: TextStyle(
                          inherit: false,
                          color: Color(0xff333333),
                          fontSize: screen.calc(34),
                          fontWeight: FontWeight.w700,
                        )
                    )
                )
            ),
            Container(
              alignment: Alignment.centerRight,
              width: screen.calc(100),
              // child: Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}