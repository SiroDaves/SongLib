import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'exports.dart';

class AppTextStyles {
  static const TextStyle titleWhite = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle titleWhiteBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle titleWhiteMedium = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
  static const TextStyle titleWhiteMediumBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle titleWhiteBig = TextStyle(
    fontSize: 22,
    color: Colors.white,
  );
  static const TextStyle titleWhiteBigBold = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle textWhiteMedium = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static const TextStyle textWhiteMediumBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle textWhite = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );
  static const TextStyle textWhiteBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle textActiveMedium = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
  static const TextStyle textActive = TextStyle(
    fontSize: 14,
    color: AppColors.activeColor,
  );
  static TextStyle head = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
  );
  static TextStyle subHead = GoogleFonts.raleway(
    textStyle: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  static TextStyle sub2Head = GoogleFonts.raleway(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  static TextStyle medium = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  static TextStyle small = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      height: 1.2,
    ),
  );

  static BoxShadow defaultShadow = const BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 20,
    color: Colors.black26,
  );

  static BoxShadow lightShadow = const BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Colors.black12,
  );
}
