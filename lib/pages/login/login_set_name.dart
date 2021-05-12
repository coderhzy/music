import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/round_flat_button.dart';
import 'package:music/pages/login/header.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class LoginSetName extends HookWidget{
  final onSubmit;

  LoginSetName({Key key, this.onSubmit}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    final nickname=useState('');

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: '给自己取一个昵称',
                ),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                            'assets/login_img_one.png',
                            width: screen.calc(344),
                            height: screen.calc(311)
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screen.calc(30)),
                          child: Text('你希望大家怎么称呼你呢？', style: TextStyle(
                            fontSize: screen.calc(26),
                          )),
                        ),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: screen.calc(60)),
                  child: Column(
                    children: [
                      Container(
                        height: screen.calc(92),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              width: 1,
                              color: Color(0xffe6e6e6),
                            ))
                        ),
                        child: TextField(
                          onChanged: (val){
                            nickname.value=val;
                          },
                          cursorColor: Color(0xff808080),
                          decoration: InputDecoration(
                            hintText: '请输入昵称',
                            hintStyle: TextStyle(
                              color: Color(0xffe6e6e6),
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: screen.calc(21)),
                        child: Row(
                          children: [
                            Icon(Icons.warning, size: screen.calc(28), color: Color(0xffc2473a)),
                            Padding(
                                padding: EdgeInsets.only(left: screen.calc(14)),
                                child: Text('该昵称已被注册，请换一个', style: TextStyle(
                                  color: Color(0xffea4d44),
                                  fontSize: screen.calc(22),
                                ))
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screen.calc(81)),
                  child: RoundFlatButton(
                    disabled: nickname.value.length<6,
                    height: screen.calc(80),
                    width: screen.calc(686),
                    bgColor: Color(0xffeb5443),
                    child: Text('完成', style: TextStyle(
                      color: Colors.white,
                    )),
                    onTap: (){
                      onSubmit(nickname.value);
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}