import 'package:aspartec_plus/app/global/colors.dart';
import 'package:flutter/material.dart';

List<Widget> getBackgroundCircles(Size size) => [
  Positioned(
    top: size.height * .05,
    right: -100,
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: orangeCircle
      ),
    )
  ),
  Positioned(
    top: size.height * .21,
    left: size.width * 0.16,
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lightRedCircle
      ),
    )
  ),
  Positioned(
    top: size.height * .5,
    left: size.width * 0.02,
    child: Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blueCircle
      ),
    )
  ),
  Positioned(
    top: size.height * .74,
    right: size.width * 0.22,
    child: Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lightGreenCircle
      ),
    )
  ),
  Positioned(
    top: size.height * .90,
    right: size.width * 0.1,
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ligthBlueCircle
      ),
    )
  ),
];