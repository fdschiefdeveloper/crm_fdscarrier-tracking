import 'package:flutter/material.dart';

class Responsive {
  late double width;
  late double height;
  late bool isMobile;
  late bool isTablet;
  late bool isDesktop;

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    width = size.width;
    height = size.height;
    
    isMobile = size.width < 768;
    isTablet = size.width < 1024;
    isDesktop = size.width >= 1024;
  }
}
