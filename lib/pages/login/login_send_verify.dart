import 'package:flutter/material.dart';

import 'package:music/util/screen_util.dart';

import 'package:music/pages/login/header.dart';

class LoginSendVerify extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: screen.top, left: screen.calc(32), right: screen.calc(32)),
            child: Column(
              children: [
                Header(title: '绑定手机号'),
                Container(
                  child: Text('a'),
                ),
              ],
            ),
          )
      ),
    );
  }
}