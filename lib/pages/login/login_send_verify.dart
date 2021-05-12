import 'dart:async';

import 'package:flutter/material.dart';

import 'package:music/util/screen_util.dart';

import 'package:music/pages/login/header.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class LoginSendVerify extends HookWidget {
  final onFinished;

  LoginSendVerify({Key key,this.onFinished}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Hero(
      tag: 'login_send_verifyCode',
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
              top: screen.top, left: screen.calc(32), right: screen.calc(32)),
          child: Column(
            children: [
              Header(title: '手机号验证'),
              Container(
                child: Column(
                  children: [
                    _Verify(),
                    _InputVerCode(
                        onFinished:this.onFinished
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

/// 短信验证码部分
class _Verify extends HookWidget {
  Timer timer;

  _Verify({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    final time = useState(60);

    var timeout;

    if (time.value <= 0) {
      timeout = true;

      if (timer != null) {
        timer.cancel();
      }
    } else {
      timeout = false;

      if (timer != null) {
        timer.cancel();
      }
      timer = Timer(Duration(seconds: 1), () {
        time.value--;
      });
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: screen.calc(100)),
          alignment: Alignment.centerLeft,
          child: Text(
            '验证码已发送至',
            style: TextStyle(
                fontSize: screen.calc(34), fontWeight: FontWeight.w700),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(top: screen.calc(30)),
                child: Text(
                  '+86 115******11',
                  style: TextStyle(color: Color(0xffa7a7a7)),
                )),
            Spacer(),
            timeout
                ? FlatButton(
                    onPressed: () {
                      print('重新发送');
                      time.value = 60;
                    },
                    child: Text(
                      '重新发送',
                      style: TextStyle(color: Colors.blue),
                    ))
                : Text(
                    '${time.value}',
                    style: TextStyle(
                        fontSize: screen.calc(26), color: Color(0xffa7a7a7)),
                  )
          ],
        )
      ],
    );
  }
}

/// 输入验证码部分
class _InputVerCode extends HookWidget {
  final onFinished;

  const _InputVerCode({Key key,this.onFinished}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final inputValues = useState(['', '', '', '']);

    List<Widget> inputs = [];
    for (var i = 0; i < 4; i++) {
      inputs.add(Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            width: screen.calc(4),
            color: inputValues.value[i] == '' ? Color(0xffb2b2b2) : Colors.blue,
          ))),
          child: TextField(
            autofocus: i == 0,
            onChanged: (val) {
              /// 下方两行code如果放在if语句下方，会导致最后一个输入框不可正常失去焦点
              List arr = inputValues.value;
              arr[i] = val;

              /// 建议使用全局聚焦FocsScope
              if (i == 3) {
                FocusScope.of(context).unfocus();
                onFinished(arr.join(''));
              } else {
                FocusScope.of(context).nextFocus();
              }
              inputValues.value = arr;
            },
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screen.calc(36)),
            decoration: InputDecoration(border: InputBorder.none),
            keyboardType: TextInputType.number,
          ),
        ),
      ));
      inputs.add(Container(
        width: screen.calc(35),
      ));
    }
    inputs.removeAt(inputs.length - 1);

    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: screen.calc(128)),
            child: Row(
              children: inputs,
            ),
          )
        ],
      ),
    );
  }
}
