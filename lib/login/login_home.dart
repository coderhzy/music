import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class LoginHome extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onCancel;
  final VoidCallback onWechat;
  final VoidCallback onQQ;
  final VoidCallback onWeibo;
  final VoidCallback onApple;
  final VoidCallback onEasy;

  LoginHome({
    Key key,
    this.onLogin,
    this.onCancel,
    this.onWechat,
    this.onQQ,
    this.onWeibo,
    this.onApple,
    this.onEasy,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    return Scaffold(
      body: Container(
        color: Color(0xffc93e2d),
        width: screen.width,
        height: screen.height,
        child: Stack(
          children: [
            Container(
              width: screen.width,
              child: Column(
                children: [
                  Container(
                    width: screen.calc(149),
                    height: screen.calc(148),
                    margin: EdgeInsets.only(top: screen.calc(312)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screen.calc(148 / 2)),
                      color: Color(0xffde4033),
                      image: DecorationImage(
                        image: AssetImage('assets/icon_login_logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screen.calc(202)),
                    child: Column(
                      children: [
                        _Button(
                          child: Text('手机号登录',
                              style: TextStyle(
                                color: Color(0xffea4d44),
                                fontSize: screen.calc(32),
                              )),
                          bgColor: Colors.white,
                          width: screen.calc(556),
                          height: screen.calc(92),
                          onTap: onLogin,
                        ),
                        Container(
                          height: screen.calc(36),
                        ),
                        _Button(
                          outline: true,
                          child: Text('立即体验',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screen.calc(32),
                              )),
                          color: Colors.white,
                          width: screen.calc(556),
                          height: screen.calc(92),
                          onTap: onCancel,
                        ),
                        Container(
                          height: screen.calc(77),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor:
                                        Colors.white.withOpacity(.4)),
                                child: Checkbox(
                                  value: false,
                                  onChanged: (val) {},
                                ),
                              ),
                              Text('同意',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.4),
                                      fontSize: screen.calc(25))),
                              Text('《服务条款》',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.8),
                                      fontSize: screen.calc(25))),
                              Text('《隐私政策》',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.8),
                                      fontSize: screen.calc(25))),
                              Text('《儿童隐私政策》',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.8),
                                      fontSize: screen.calc(25))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /// 底部第三方登录
            Positioned(
              bottom: screen.calc(72),
                width: screen.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: screen.calc(10),right: screen.calc(10)),
                  child: _Button(
                    child: Image.asset('assets/icon_wechat.png'),
                    bgColor: Colors.white,
                    width: screen.calc(72),
                    height: screen.calc(72),
                    padding: EdgeInsets.zero,
                    onTap: onWechat,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                  child: _Button(
                    child: Image.asset('assets/icon_qq.png'),
                    bgColor: Colors.white,
                    width: screen.calc(72),
                    height: screen.calc(72),
                    padding: EdgeInsets.zero,
                    onTap: onQQ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                  child: _Button(
                    child: Image.asset('assets/icon_weibo.png'),
                    bgColor: Colors.white,
                    width: screen.calc(72),
                    height: screen.calc(72),
                    padding: EdgeInsets.zero,
                    onTap: onWeibo,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: screen.calc(10),right: screen.calc(10)),
                  child: _Button(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon_apple.png',
                          width: screen.calc(32),
                          height: screen.calc(32),
                        ),
                        Text('通过Apple登录')
                      ],
                    ),
                    bgColor: Colors.white,
                    width: screen.calc(280),
                    height: screen.calc(68),
                    padding: EdgeInsets.zero,
                    onTap: onApple,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screen.calc(10), right: screen.calc(10)),
                  child: _Button(
                    child: Image.asset('assets/icon_easy.png'),
                    bgColor: Colors.white,
                    width: screen.calc(72),
                    height: screen.calc(72),
                    padding: EdgeInsets.zero,
                    onTap: onEasy,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}


/// 封装登录页button，外部传入属性
/// 注意使用FlatButton时候，想要颜色生效，必须添加onPressed
class _Button extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final String title;
  final Widget child;
  final bool outline;
  final num height;
  final num width;
  final EdgeInsets padding;
  final onTap;

  _Button({
    Key key,
    this.color = Colors.black,
    this.bgColor = Colors.white,
    this.title,
    this.outline = false,
    this.child,
    this.width = 100.0,
    this.height = 100.0,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    print(this.child);

    Widget child;

    if (this.child == null) {
      child = Text(
        title,
        style: TextStyle(
          color: color,
        ),
      );
    } else {
      child = this.child;
    }

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height / 2),
    );
    var button;

    if (outline) {
      button = OutlineButton(
        shape: shape,
        borderSide: BorderSide(color: color, width: 2),
        highlightedBorderColor: color,
        child: child,
        padding: padding,
        onPressed: onTap,
      );
    } else {
      button = FlatButton(
        shape: shape,
        color: bgColor,
        child: child,
        padding: padding,
        onPressed: onTap,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: button,
    );
  }
}

