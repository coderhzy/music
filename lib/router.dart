import 'package:flutter/material.dart';
import 'package:music/pages/splash/splash.dart';
import 'package:music/pages/home/home.dart';
import 'package:music/pages/square/square.dart';
import 'package:music/pages/player/player.dart';

final routes = {
  '/': (BuildContext context) => SplashPage(),
  '/home': (BuildContext context) => HomePage(),
  '/square': (BuildContext context) => SquarePage(),
  '/player': (BuildContext context) => PlayerPage(),
};
