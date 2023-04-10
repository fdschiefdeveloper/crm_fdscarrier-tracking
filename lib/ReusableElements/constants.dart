import 'package:flutter/material.dart';

// MAIN COLORS
const colorPrimario = Color.fromRGBO(181, 197, 201, 1);
const colorSecundario = Color.fromRGBO(73, 85, 92, 1);
const colorTerciario = Color.fromRGBO(163, 182, 187, 1);
//245 2 2
//73 85 92
// 163 182 187
//183 0 0

// FONTS
//FONT COLORS

//IMAGES
const background = "Photos/background.png";
const logoFDS = "Photos/Imagotipo.png";
const logoloading = "Photos/Logo-loading.gif";
//Elements for Dashboard

const defaultPadding = 16.0;

abstract class FontStylesMonserrat {
  static const TextStyle titleInspection = TextStyle(
    fontSize: 35,
    color: colorSecundario,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );

  //////////////////////////////////////////////////////////
  static const TextStyle titleH1 = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
}
