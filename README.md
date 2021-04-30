# music

## 1. 初识
1. Widget-> 原件/组件
可以放到视图当中被用户使用的东西,看的见或者看不见的(gesture)叫做Widget
2. State   
StatelessWidget 无状态 -> 自身不变 -> 性能高 
StatefulWidget 有状态 -> 自身会变 -> 性能较低
   
-----------------------------------------------------------------
3. 包
- 系统包
- 自己构建的
- 三方包

pub.dev如何使用
1. 添加依赖
   pubspec.yaml
2. 安装依赖
   flutter pub get
3. 引入包
   import 'package:flutter_hooks/flutter_hooks.dart'