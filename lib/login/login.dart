import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music/login/login_home.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final step = useState(1);
    final steps = {
      1: LoginHome(
        onLogin: () {
          step.value++;
        },
        onCancel: () {},
        onWechat: () {},
        onQQ: () {},
        onWeibo: () {},
        onApple: () {},
        onEasy: () {},
      ),
    };

    return steps[step.value];
  }
}
