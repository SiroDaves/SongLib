import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

Future<bool> isKeyboardShowing() async {
  // ignore: unnecessary_null_comparison
  if (WidgetsBinding.instance != null) {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  } else {
    return false;
  }
}

Future<void> closeKeyboard(BuildContext context) async {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

Future<bool> hasReliableInternetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

String? textValidator(String? value) {
  if (value!.isEmpty) {
    return 'This field is required';
  }
  return null;
}

bool isNumeric(String s) {
  // ignore: unnecessary_null_comparison
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

String refineTitle(String songTitle) {
  return songTitle.replaceAll("''L", "'l").replaceAll("''", "'");
}

String refineContent(String songContent) {
  return songContent.replaceAll("''", "'").replaceAll("\\n", " ");
}

String songItemTitle(int number, String title) {
  return "$number. ${refineTitle(title)}";
}

String songCopyString(String title, String content) {
  return "$title\n\n$content";
}

String bookCountString(String title, int count) {
  return '$title ($count)';
}

String lyricsString(String lyrics) {
  return lyrics.replaceAll("\\n", "\n").replaceAll("''", "'");
}

String songViewerTitle(int number, String title, String alias) {
  String songtitle = "$number. ${refineTitle(title)}";

  if (alias.length > 2 && title != alias) {
    songtitle = "$songtitle (${refineTitle(alias)})";
  }

  return songtitle;
}

String songShareString(String title, String content) {
  return "$title\n\n$content\n\nvia #vSongBook https://Appsmata.com/vSongBook";
}

String verseOfString(String number, int count) {
  return 'VERSE $number of $count';
}

double getFontSize(int characters, double height, double width) {
  return sqrt((height * width) / characters);
}
