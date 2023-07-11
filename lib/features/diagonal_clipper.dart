import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    print("------------");
    print(size.height);
    print(size.width);
    print("------------");

    // 대각선이 끊어지는 부분 수정가능
    path.moveTo(0, size.height * 0.3);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.6);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
