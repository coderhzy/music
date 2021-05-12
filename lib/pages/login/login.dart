import 'package:flutter/material.dart';

import 'package:music/pages/login/login_home.dart';
import 'package:music/pages/login/login_send_verify.dart';
import 'package:music/pages/login/login_set_name.dart';
import 'package:music/pages/login/login_set_pwd.dart';
import 'package:music/pages/login/login_tel_bind.dart';
import 'package:music/store.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';


class LoginPage extends HookWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final dispatch= useDispatch<StoreState>();


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
          Navigator.pushNamed(context, '/login',arguments: {
            'step': 4
          });
        },
      ),
      4: LoginSetPwd(
        onSubmit: (pwd){
          print(pwd);

          Navigator.pushNamed(context, '/login',arguments: {
            'step':   5
          });
        },
      ),
      5: LoginSetName(
        onSubmit: (nickname){
          print(nickname);

          /// 完成注册
          dispatch(StoreAction(StoreActionType.UserLogin, nickname));

          Navigator.pushNamed(context, '/home',);
        },
      )
    };

    return steps[step];
  }
}
