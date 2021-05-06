import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// prev = (n - 1 + 10) % 10   , cur = n , next = (n + 1) % 10;

/// 定义数据
var items = [
  {
    'index': 0,
    'title': '111',
    'img': 'assets/tmp_square_cover_1.png',
  },
  {
    'index': 1,
    'title': '请保持眉梢幻月，因为有人等你',
    'img': 'assets/tmp_square_cover_2.png',
  },
  {
    'index': 2,
    'title': '333',
    'img': 'assets/tmp_square_cover_3.png',
  },
  {
    'index': 3,
    'title': '444',
    'img': 'assets/tmp_square_cover_4.png',
  },
  {
    'index': 4,
    'title': '555',
    'img': 'assets/tmp_square_cover_5.png',
  },
  {
    'index': 5,
    'title': '666',
    'img': 'assets/tmp_square_cover_6.png',
  },
];

class BannerSlider extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final screen = Screen(context);
    final _value = useState(0);

    /// 定位位置参数
    final prev = (_value.value - 1 + items.length) % items.length,
        cur = _value.value,
        next = (_value.value + 1) % items.length;

    /// 图片以及常用大小
    final W = screen.calc(344),
        H = screen.calc(438),
        offsetH = screen.calc(200);

    /// prev & next透明度一样，cur透明度1.0
    final secondaryData = {'scale': .8, 'opacity': .5},
        curData = {'scale': 1.0, 'opacity': 1.0},
        otherData = {'scale': .8, 'opacity': 0.0};

    items.sort((item1, item2) {
      double opacity1, opacity2;

      if (item1['index'] == prev || item1['index'] == next)
        opacity1 = secondaryData['opacity'];
      else if (item1['index'] == cur)
        opacity1 = curData['opacity'];
      else
        opacity1 = otherData['opacity'];

      if (item2['index'] == prev || item2['index'] == next)
        opacity2 = secondaryData['opacity'];
      else if (item2['index'] == cur)
        opacity2 = curData['opacity'];
      else
        opacity2 = otherData['opacity'];

      /// 根据opacity进行从小到大排序
      if (opacity1 < opacity2)
        return -1;
      else if (opacity1 > opacity2) return 1;
      return 0;
    });

    return GestureDetector(
        onHorizontalDragEnd: (detail) {
          /// 根据用户手势左右滑动的velocity(速度)来控制
          var dx = detail.velocity.pixelsPerSecond.dx;

          /// 给dx加判断，防止用户误触
          if (dx.abs() >= 50) {
            if (dx < 0) {
              _value.value = (_value.value + 1) % items.length;
            } else {
              _value.value = (_value.value - 1 + items.length) % items.length;
            }
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: screen.calc(38)),
          height: H,
          child: Stack(
            children: items.map((item) {
              var index = item['index'];
              var data;

              /// 判断index和cur，将curData对象赋值给{}，其他同理
              if (index == cur)
                data = curData;
              else if (index == prev || index == next)
                data = secondaryData;
              else
                data = otherData;

              var offset = Offset(0, 0);

              /// 判断左移右移，设置Offset位移距离
              if (index == prev)
                offset = Offset(-offsetH, 0);
              else if (index == next) offset = Offset(offsetH, 0);

              return Transform.translate(
                  offset: offset,
                  child: Transform.scale(
                      scale: data['scale'],
                      child: Opacity(
                        opacity: data['opacity'],
                        // opacity: 1,
                        child: Container(
                            width: W,
                            height: H,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(screen.calc(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x66000000),
                                      blurRadius: screen.calc(20))
                                ]),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(screen.calc(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    item['img'],
                                    width: screen.calc(344),
                                    height: screen.calc(344),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: screen.calc(18),
                                        left: screen.calc(16),
                                        right: screen.calc(16)),
                                    child: Text(
                                      item['title'],
                                      maxLines: 2,
                                      style:
                                          TextStyle(fontSize: screen.calc(23)),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      )));
            }).toList(),
          ),
        ));
  }
}

// class BannerSlider extends HookWidget{
//   @override
//   Widget build(BuildContext context) {
//     final screen=Screen(context);
//     final _value=useState(0);
//
//     final
//       prev=(_value.value-1+items.length)%items.length,
//       cur=_value.value,
//       next=(_value.value+1)%items.length;
//
//     final W=screen.calc(344),H=screen.calc(438),offsetH=screen.calc(200);
//     final L=(screen.width-W)/2;
//
//     final
//       secondaryData={'scale': .8, 'opacity': .5},
//       curData={'scale': 1.0, 'opacity': 1.0},
//       otherData={'scale': .8, 'opacity': 0.0};
//
//     items.sort((item1, item2){
//       double opacity1,opacity2;
//
//       if(item1['index']==prev || item1['index']==next) opacity1=secondaryData['opacity'];
//       else if(item1['index']==cur) opacity1=curData['opacity'];
//       else opacity1=otherData['opacity'];
//
//       if(item2['index']==prev || item2['index']==next) opacity2=secondaryData['opacity'];
//       else if(item2['index']==cur) opacity2=curData['opacity'];
//       else opacity2=otherData['opacity'];
//
//       if(opacity1<opacity2) return -1;
//       else if(opacity1>opacity2) return 1;
//       return 0;
//     });
//
//     return Container(
//       margin: EdgeInsets.only(top: screen.calc(38)),
//       width: screen.width,
//       height: H,
//       child: Stack(
//         children: items.map((item){
//           var index=item['index'];
//           var data;
//
//           if(index==cur) data=curData;
//           else if(index==prev || index==next) data=secondaryData;
//           else data=otherData;
//
//           var offset=Offset(0,0);
//           if(index==prev)offset=Offset(-offsetH, 0);
//           else if(index==next)offset=Offset(offsetH, 0);
//
//           return Positioned(
//             left: L,
//
//             child: Transform.translate(
//               offset: offset,
//               child: Transform.scale(
//                 scale: data['scale'],
//                 child: Opacity(
//                   opacity: data['opacity'],
//                   // opacity: 1,
//                   child: Container(
//                     width: W,
//                     height: H,
//                     decoration: BoxDecoration(
//                       color: Colors.red
//                     ),
//                     child: Center(
//                       child: Text(item['title'], style: TextStyle(
//                         fontSize: 40,
//                       ))
//                     ),
//                   )
//                 )
//               )
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
