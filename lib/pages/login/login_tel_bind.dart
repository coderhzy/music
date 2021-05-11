import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:music/widgets/round_flat_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:music/pages/login/header.dart';

class LoginTelBind extends StatelessWidget {
  final onNext;

  LoginTelBind({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(
            top: screen.top, left: screen.calc(32), right: screen.calc(32)),
        child: Column(
          children: [
            Header(title: '绑定手机号'),
            Padding(
              padding: EdgeInsets.only(top: screen.calc(72)),
              child: Center(
                child: Image.asset('assets/login_img_one.png',
                    width: screen.calc(344), height: screen.calc(311)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: screen.calc(10)),
                child: Text('绑定手机号，让你的账号更安全',
                    style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: screen.calc(26),
                    ))),
            _Content(
              onNext: onNext,
            ),
          ],
        ),
      )),
    );
  }
}

class _Content extends HookWidget {
  final onNext;

  _Content({Key key, this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);

    final items = [
      '+86',
      '+78',
      '+45',
      '+13',
      '+88',
    ];
    final curArea = useState(items[0]);
    final validate = useState(false);
    /// 因为Hook组件，页面会在输入确认会重新构建，建议使用UseState,否则输入框会置空
    final controller = useState(TextEditingController());

    /// 监听输入并验证
    controller.value.addListener(() {
      var re = r"^[1]([3-9])[0-9]{9}$";
      validate.value = RegExp(re).hasMatch(controller.value.value.text);
    });

    return Container(
      margin: EdgeInsets.only(top: screen.calc(72)),
      child: Column(
        children: [
          Container(
              child: Row(
            children: [
              DropdownButton(
                style: TextStyle(
                  fontSize: screen.calc(32),
                  color: Color(0xff333333),
                ),
                value: curArea.value,
                onChanged: (val) {
                  curArea.value = val;
                },
                items: items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
              ),
              Expanded(
                child: TextField(
                  controller: controller.value,
                  style: TextStyle(
                    fontSize: screen.calc(30),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  /// 系统键盘
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          )),
          Padding(
              padding: EdgeInsets.only(top: screen.calc(61)),
              child: RoundFlatButton(
                disabled: !validate.value,
                width: screen.calc(686),
                height: screen.calc(80),
                bgColor: Color(0xffea4331),
                child: Text('下一步',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screen.calc(32),
                    )),
                onTap: () {
                  onNext(curArea.value, controller.value.value.text);
                },
              )),
        ],
      ),
    );
  }
}
