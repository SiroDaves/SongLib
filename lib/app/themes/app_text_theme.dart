import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appBarTextStyle = GoogleFonts.comfortaa(
  textStyle: const TextStyle(fontWeight: FontWeight.w700),
);

var kHeadTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(fontWeight: FontWeight.w700),
);

var kSubHeadTextStyle = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
  ),
);

var kSub2HeadTextStyle = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
  ),
);

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 0),
  blurRadius: 20,
  color: Colors.black26,
);

const kLightShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12,
);
