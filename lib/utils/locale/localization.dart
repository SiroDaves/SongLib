import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:songlib/utils/locale/localization_keys.dart';
import 'package:songlib/utils/locale/localization_overrides.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class Localization {
  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  final Locale locale;

  Localization({required this.locale});

  static Future<Localization> load(Locale locale, {
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
    }) async {
    final localizations = Localization(locale: locale);
    if (showLocalizationKeys) {
      return localizations;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations = await localizationOverrides.getOverriddenLocalizations(locale);
      localizations._localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await rootBundle.loadString('assets/locale/${locale.toLanguageTag()}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>; // ignore: avoid_as
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      var newValue = value;
      // ignore: avoid_annotating_with_dynamic
      args.asMap().forEach((index, dynamic arg) => newValue = _replaceWith(newValue, arg, index + 1));
      return newValue;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String _replaceWith(String value, Object? arg, int argIndex) {
    if (arg == null) return value;
    if (arg is String) {
      return value.replaceAll('%$argIndex\$s', arg);
    } else if (arg is num) {
      return value.replaceAll('%$argIndex\$d', '$arg');
    }
    return value;
  }

  /// Translations:
  ///
  /// en:  **'continue'**
  ///
  /// fr:  **'continuer'**
  String get continueButton => _t(LocalizationKeys.continueButton);

  /// Translations:
  ///
  /// en:  **'career'**
  ///
  /// fr:  **''**
  String get careerButton => _t(LocalizationKeys.careerButton);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);

}
