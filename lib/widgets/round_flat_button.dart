import 'package:flutter/material.dart';
import 'package:music/util/screen_util.dart';

class RoundFlatButton extends StatelessWidget{
  final Color color;
  final Color bgColor;
  final String title;
  final Widget child;
  final bool outline;
  final num height;
  final num width;
  final EdgeInsets padding;
  final onTap;
  final bool disabled;

  RoundFlatButton({
    Key key,
    this.color=Colors.black,
    this.bgColor=Colors.white,
    this.title,
    this.outline=false,
    this.child,
    this.width=100.0,
    this.height=100.0,
    this.padding,
    this.onTap,
    this.disabled=false,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen=Screen(context);
    assert(this.child==null || title==null);

    Widget child;

    if(this.child==null){
      child=Text(
        title,
        style: TextStyle(
          color: color,
        ),
      );
    }else{
      child=this.child;
    }

    final shape=RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(height/2),
    );
    var button;

    if(outline){
      button=OutlineButton(
        /// 去除点击效果
        highlightColor: disabled?bgColor:null,
        splashColor: disabled?bgColor:null,
        shape: shape,
        borderSide: BorderSide(color: color, width: 2),
        highlightedBorderColor: color,
        child: child,
        padding: padding,
        onPressed: disabled?(){}:onTap,
      );
    }else{
      button=FlatButton(
        /// 去除点击效果
        highlightColor: disabled?bgColor:null,
        splashColor: disabled?bgColor:null,
        shape: shape,
        color: bgColor,
        child: child,
        padding: padding,
        onPressed: disabled?(){}:onTap,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: Opacity(
          opacity: disabled?0.6:1,
          child: button
      ),
    );
  }
}
