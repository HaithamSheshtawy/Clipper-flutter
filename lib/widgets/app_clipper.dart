import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  final double cornerRedius;
  final double diagonalHeight;
  AppClipper({this.cornerRedius, this.diagonalHeight});
  @override
  getClip(Size size) {
    Path path = new Path();

    path.moveTo(0, cornerRedius * 1.5);
    path.lineTo(0, size.height - cornerRedius);
    path.quadraticBezierTo(0, size.height, cornerRedius,
        size.height); // play with width to draw curve to down
    path.lineTo(size.width - cornerRedius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width,
        size.height - cornerRedius); // play with height to draw curve to top
    path.quadraticBezierTo(
        size.width, cornerRedius * 1.5, size.width, cornerRedius);
    path.lineTo(size.width, diagonalHeight);
    path.quadraticBezierTo(size.width, diagonalHeight,
        size.width - cornerRedius, diagonalHeight * .9);
    path.lineTo(cornerRedius * 2, cornerRedius);
    path.quadraticBezierTo(0, 0, 0, cornerRedius * 1.5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
