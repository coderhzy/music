import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyBanner extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var screen = Screen(context);
    final current = useState(0);
    final items = [
      'assets/tmp_slider_1.png',
      'assets/tmp_slider_2.png',
      'assets/tmp_slider_3.png'
    ];

    var dotSize = 12.0;

    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: screen.calc(40)),
            child: CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (val, _reason) {
                    current.value = val;
                  },
                  height: screen.calc(268),
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(microseconds: 500),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: items
                    .map(
                      (item) => Builder(builder: (context) {
                        return Image.asset(
                          item,
                          width: screen.calc(686),
                          height: screen.calc(268),
                        );
                      }),
                    )
                    .toList())),
        Positioned(
            bottom: screen.calc(36),
            left:
                (screen.width - screen.calc((dotSize + 8) * items.length)) / 2,
            child: Container(
                child: Row(
              children: items
                  .asMap()
                  .map((index, item) => MapEntry(
                        index,
                        Container(
                          margin: EdgeInsets.only(left: 4, right: 4),
                          width: screen.calc(dotSize),
                          height: screen.calc(dotSize),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screen.calc(dotSize / 2)),
                            color: index == current.value
                                ? Color(0xFFff3a3a)
                                : Color(0xaaffffff),
                          ),
                        ),
                      ))
                  .values
                  .toList(),
            )))
      ],
    );
  }
}
