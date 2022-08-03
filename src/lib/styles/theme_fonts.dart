import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeFonts {
  ThemeFonts._();

  static const _openSans = 'SaranaiGame';

  static const title = _openSans;
  static const body = _openSans;
  static const button = _openSans;
}

var titleTextStyle = GoogleFonts.comfortaa(
  textStyle: const TextStyle(fontWeight: FontWeight.w900),
);

var normalTextStyle = GoogleFonts.comfortaa(
  textStyle: const TextStyle(fontWeight: FontWeight.w600),
);

var kHeadTextStyle = GoogleFonts.lato(
  textStyle: const TextStyle(fontWeight: FontWeight.w700),
);

var kSubHeadTextStyle = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
  ),
);
