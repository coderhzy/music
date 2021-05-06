import 'dart:io';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

void setStatusBarStyle(Brightness iconStyle) {
  /// 判断Android去除最上方栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: iconStyle,
    ));
  }
}
