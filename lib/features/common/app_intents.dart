import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlideNumberIntent extends Intent {
  final int slideNumber;
  const SlideNumberIntent(this.slideNumber);
}

class SlideLetterIntent extends Intent {
  final String letter;
  const SlideLetterIntent(this.letter);
}

class CloseIntent extends Intent {
  const CloseIntent();
}

class NextIntent extends Intent {
  const NextIntent();
}

class PreviousIntent extends Intent {
  const PreviousIntent();
}

class BiggerFontIntent extends Intent {
  const BiggerFontIntent();
}

class SmallerFontIntent extends Intent {
  const SmallerFontIntent();
}

class InfoIntent extends Intent {
  const InfoIntent();
}

class  SearchIntent extends Intent {
  const SearchIntent();
}

class  OpenIntent extends Intent {
  const OpenIntent();
}
