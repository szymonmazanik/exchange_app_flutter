import 'dart:ui';

import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: <Widget>[
            ForegroundClipPathWidget(),
            MiddleClipPathWidget(),
            BackgroundClipPathWidget(),
          ],
        ),
      );
}

class ForegroundClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      CustomClipPathWidget(ForegroundClipPath());
}

class MiddleClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CustomClipPathWidget(MiddleClipPath());
}

class BackgroundClipPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      CustomClipPathWidget(BackgroundClipPath());
}

class CustomClipPathWidget extends StatelessWidget {
  final CustomClipper<Path> customClipper;

  CustomClipPathWidget(this.customClipper);

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: 0.45,
        child: ClipPath(
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: AppColors.primaryColor,
          ),
          clipper: customClipper,
        ),
      );
}

class BackgroundClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstControlPoint = Offset(size.width * .25, 20);
    var firstEndPoint = Offset(size.width * .5, 20);
    var secondControlPoint = Offset(size.width * .75, 10);
    var secondEndPoint = Offset(size.width, 80);

    return Path()
      ..lineTo(0.0, size.height * 0.4)
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MiddleClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var firstControlPoint = Offset(size.width * .2, 100);
    var firstEndPoint = Offset(size.width * .5, 90);
    var secondControlPoint = Offset(size.width, 80);
    var secondEndPoint = Offset(size.width, 100);

    return Path()
      ..lineTo(0.0, size.height * 0.6)
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ForegroundClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset firstEndPoint = Offset(size.width * .5, 40);
    Offset firstControlPoint = Offset(size.width * .25, 40);
    Offset secondEndPoint = Offset(size.width, 50);
    Offset secondControlPoint = Offset(size.width * .75, 30);

    return Path()
      ..lineTo(0.0, size.height * 0.2)
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
