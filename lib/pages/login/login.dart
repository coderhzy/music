import 'package:flutter/material.dart';

import 'package:music/pages/login/login_home.dart';
import 'package:music/pages/login/login_send_verify.dart';
import 'package:music/pages/login/login_tel_bind.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    var step = 1;
    if (args != null) {
      step = (args as Map)['step'];
    }
    final steps = {
      1: LoginHome(
        onLogin: () {
          Navigator.pushNamed(context, '/login', arguments: {
            'step': 2,
          });
        },
        onCancel: () {},
        onWechat: () {},
        onQQ: () {},
        onWeibo: () {},
        onApple: () {},
        onEasy: () {},
      ),
      2: LoginTelBind(
        onNext: (area, phone) {
          print(area);
          print(phone);

          Navigator.pushNamed(context, '/login', arguments: {
            'step': 3,
          });
        },
      ),
      3: LoginSendVerify(
        onFinished: (code){
          print(code);
        },
      )
    };

    return steps[step];
  }
}
