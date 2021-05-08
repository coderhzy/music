import 'package:flutter/material.dart';

final _disableOpacity = .5;

/// 封装播放页button组件
class ImgButton extends StatelessWidget {
  final VoidCallback onTap;
  final String assetName;
  final width;
  final height;

  const ImgButton(this.assetName,
      {Key key, this.onTap, this.width = 50, this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap != null
        ? GestureDetector(
            onTap: onTap,
            child: Image.asset(
              assetName,
              width: width,
              height: height,
            ),
          )
        : Opacity(
            opacity: _disableOpacity,
            child: Image.asset(
              assetName,
              width: width,
              height: height,
            ),
          );
  }
}
