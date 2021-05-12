import 'package:flutter/material.dart';
import 'package:music/pages/login/header.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/round_flat_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginSetPwd extends HookWidget {
  final onSubmit;
  const LoginSetPwd({Key key,this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final password = useState('');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: screen.calc(32), right: screen.calc(32)),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: screen.calc(72)),
                child: Header(title: '重设密码')),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: screen.calc(90)),
              child: Text(
                '设置密码后，可使用手机号 + 密码登录',
                style: TextStyle(fontSize: screen.calc(26)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screen.calc(50)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: screen.calc(1),
                    color: Color(0xffcccccc)
                  ) 
                )
              ),
              child: TextField(
                onChanged: (val){
                  password.value = val;
                },
                style: TextStyle(
                  fontSize: screen.calc(34)
                ),
                decoration: InputDecoration(
                  hintText: '设置登录密码，不少于6位',
                  hintStyle: TextStyle(
                    color: Color(0xffcccccc),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: screen.calc(60)),
              child: RoundFlatButton(
                width: screen.calc(700),
                height: screen.calc(100),
                color: Colors.white,
                bgColor: Color(0xffeb5543),
                disabled: password.value.length<6,
                title: '确认',
                onTap: () {
                  onSubmit(password.value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
