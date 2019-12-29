import 'package:flutter/material.dart';

///Source: https://github.com/anirudhsharma392/Slider-Button
//////This class has the Shimmer and Vibration effects cut off
class SliderButtonWidget extends StatefulWidget {
  final double radius;

  final double height;
  final double width;
  final double buttonSize;

  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  final Text label;

  final Alignment alignLabel;
  final BoxShadow boxShadow;
  final Widget icon;
  final Function action;

  final bool dismissible;

  SliderButtonWidget({
    @required this.action,
    this.radius = 100,
    this.boxShadow = const BoxShadow(
      color: Colors.black,
      blurRadius: 4,
    ),
    this.height = 70,
    this.buttonSize = 60,
    this.width = 250,
    this.alignLabel = const Alignment(0.4, 0),
    this.backgroundColor = const Color(0xffe0e0e0),
    this.baseColor = Colors.black87,
    this.buttonColor = Colors.white,
    this.highlightedColor = Colors.white,
    this.label = const Text("Slide to cancel !"),
    this.icon = const Icon(
      Icons.power_settings_new,
      color: Colors.red,
      size: 30.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
    this.dismissible = true,
  }) : assert(buttonSize <= height);

  @override
  _SliderButtonWidgetState createState() => _SliderButtonWidgetState();
}

class _SliderButtonWidgetState extends State<SliderButtonWidget> {
  bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? _control()
        : widget.dismissible == true
            ? Container()
            : Container(child: _control());
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius)),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: widget.alignLabel,
              child: widget.label,
            ),
            Dismissible(
              key: Key("cancel"),
              direction: DismissDirection.startToEnd,
              onDismissed: (dir) async {
                setState(() {
                  if (widget.dismissible) {
                    flag = false;
                  } else {
                    flag = !flag;
                  }
                });
                widget.action();
              },
              child: Container(
                width: widget.width - 60,
                height: widget.height,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: (widget.height - widget.buttonSize) / 2),
                child: Container(
                  height: widget.buttonSize,
                  width: widget.buttonSize,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        widget.boxShadow,
                      ],
                      color: widget.buttonColor,
                      borderRadius: BorderRadius.circular(widget.radius)),
                  child: Center(child: widget.icon),
                ),
              ),
            ),
          ],
        ),
      );
}
