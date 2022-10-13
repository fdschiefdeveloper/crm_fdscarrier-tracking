import 'package:flutter/material.dart';

// MAIN COLORS
const verdeDefault = Color.fromRGBO(25, 79, 34, 1);
const naranjaDefault = Color.fromRGBO(207, 119, 0, 1);
const greyDefault = Color.fromRGBO(230, 230, 230, 1);

// FONTS
//FONT COLORS
const greyFont = Color.fromARGB(255, 80, 80, 80);

//IMAGES
const background = "photos/backgroundlines.png";
const logoFDS = "photos/logo.png";
const logoloading = "photos/Logo-loading.gif";
//Elements for Dashboard
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

abstract class FontStylesMonserrat {
  static const TextStyle loginButton = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontFamily: "Montserrat",
  );

  static const TextStyle entryButton = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w100,
    fontFamily: "Montserrat",
  );
  static const TextStyle titleInspection = TextStyle(
    fontSize: 35,
    color: verdeDefault,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle labels5thPage = TextStyle(
    fontSize: 20,
    color: verdeDefault,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle titleEntry = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 60, 60, 60),
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle hintEntry = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 60, 60, 60),
    fontFamily: "Montserrat",
  );
  static const TextStyle nextbackButtons = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle resultsLastPage = TextStyle(
    fontSize: 20,
    color: Color.fromARGB(255, 60, 60, 60),
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle profiletitles = TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 60, 60, 60),
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );
  static const TextStyle remarksTitles = TextStyle(
    fontSize: 25,
    color: verdeDefault,
    fontWeight: FontWeight.w600,
    fontFamily: "Montserrat",
  );
  static const TextStyle greentitles = TextStyle(
    fontSize: 16,
    color: verdeDefault,
    fontWeight: FontWeight.w700,
    fontFamily: "Montserrat",
  );

  //////////////////////////////////////////////////////////
  static const TextStyle titleH1 = TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: "Montserrat",
  );
}
