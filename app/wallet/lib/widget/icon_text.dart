import 'package:flutter/material.dart';

enum IconDirection { left, top, right, bottom }

class IconText extends StatefulWidget {
  final String label;
  final Widget icon;
  final IconDirection direction;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPress;

  IconText({
    @required this.label,
    @required this.icon,
    this.direction = IconDirection.left,
    this.textStyle,
    this.padding,
    this.onPress,
  });

  @override
  _IconTextState createState() => _IconTextState();
}

class _IconTextState extends State<IconText> {
  @override
  Widget build(BuildContext context) {
    switch (widget.direction) {
      case IconDirection.left:
        return GestureDetector(
          onTap: widget.onPress,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: widget.icon,
              ),
              Container(
                padding: widget.padding ?? EdgeInsets.only(left: 10),
                child: Text(
                  widget.label,
                  style: widget.textStyle,
                ),
              ),
            ],
          ),
        );

      case IconDirection.top:
        return GestureDetector(
          onTap: widget.onPress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              Container(
                padding: widget.padding ?? EdgeInsets.only(top: 5),
                child: Text(
                  widget.label,
                  style: widget.textStyle,
                ),
              ),
            ],
          ),
        );
      case IconDirection.right:
        return GestureDetector(
          onTap: widget.onPress,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: widget.padding ?? EdgeInsets.only(right: 10),
                child: Text(
                  widget.label,
                  style: widget.textStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: widget.icon,
              ),
            ],
          ),
        );
      case IconDirection.bottom:
        return GestureDetector(
          onTap: widget.onPress,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: widget.padding ?? EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.label,
                  style: widget.textStyle,
                ),
              ),
              widget.icon,
            ],
          ),
        );

      default:
        return Container();
    }
  }
}
