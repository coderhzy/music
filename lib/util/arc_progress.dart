import 'dart:math';
import 'package:flutter/material.dart';

class ArcProgress extends StatelessWidget {
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  ArcProgress({
    this.percent = 0.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.bgColor = Colors.grey,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ArcPainter(
        percent: percent,
        width: width,
        bgColor: bgColor,
        color: color,
      ),
    );
  }
}

/// 绘图(对是否有背景颜色进行判断)
class _ArcPainter extends CustomPainter {
  final double percent;
  final double width;
  final Color color;
  final Color bgColor;

  _ArcPainter({
    this.percent = 0.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.bgColor = Colors.grey,
  }) : super();

  /// 前景
  /// path
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
        width / 2, width / 2, size.width - width, size.height - width);

    // 背景
    if (bgColor != null) {
      // path
      final path = Path();
      // 注意在计算机中圆的0度起点
      path.arcTo(rect, -90 * pi / 180, 359.999 * pi / 180, true);

      // paint
      final paint = Paint();
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = width;
      paint.color = bgColor;

      canvas.drawPath(path, paint);
    }

    // 前景
    // path
    final path = Path();
    path.arcTo(rect, -90 * pi / 180, percent * 359.99 * pi / 180, true);

    // paint
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width;
    paint.color = color;
    paint.strokeCap = StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  /// paint画笔
  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return oldDelegate.percent != percent;
  }
}
