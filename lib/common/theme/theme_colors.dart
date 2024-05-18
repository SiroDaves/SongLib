import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

class ThemeColors {
  ThemeColors._();
  static const primary = Color(0XFFC55A11);
  static const primaryDark = Color(0XFF843C0C);
  static const accent = Color(0XFFF4B183);
  static const accentDark = Color.fromARGB(255, 208, 116, 54);
  static const accentLight = Color.fromARGB(255, 232, 143, 83);
  static const grey = Color(0xB3000000); //black 70%
  static const mediumGrey = Color(0x80000000); //black 50%
  static const lightGrey = Color(0x33000000); //black 20%
  static const backgroundGrey = Color(0xFFF1F2F3);
  static const disabledGrey = Color(0xFFE6E6E6);
  static const shadow = Color(0x1e000000); //black 12%
  static const error = Color(0xFFE30000);
  
  static const britamRed = Color(0xFFDC3444);
  static PdfColor britamRedPdf = PdfColor(192, 0, 0, 255);
  static PdfColor britamBluePdf = PdfColor(34, 65, 97, 255);
  static const whiteGrey = Color(0xFF868B9B);
  static const gray = Color(0xFFEEEEEE);
  static const success = Color(0xff116d5a);
  static const error1 = Color(0xFFfadcd3);
  static const green = Color(0xFF1A821A);
  static const yellow = Color(0xFFF1AF3A);

  static const Color midGray = Color.fromARGB(255, 198, 198, 198);
  static const Color darkGray = Color.fromARGB(255, 157, 161, 174);
  static const Color textGray = Color.fromARGB(255, 134, 139, 155);
  static const Color lightGray = Color.fromARGB(255, 242, 249, 253);
  static const Color blackText = Color.fromARGB(255, 36, 40, 45);
  static const Color trafficAmber = Color.fromARGB(255, 241, 175, 58);
  static const Color trafficRed = Color.fromARGB(255, 246, 0, 1);
  static const Color trafficGreen = Color.fromARGB(255, 0, 247, 0);
}
