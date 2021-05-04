import 'package:flutter/material.dart';

const _Width = 750;

class Screen {
  var screen;
  var width,height,top;

  Screen(BuildContext context) {
    this.screen = MediaQuery.of(context);

    width = screen.size.width;
    height = screen.size.height;
    top = screen.padding.top;
  }

  double calc(double value) {
    return value * width / _Width;
  }
}