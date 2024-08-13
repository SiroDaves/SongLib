import 'package:flutter/services.dart';

/// Currency formatter
abstract class CurrencyUtil {
  static String format(
    amount, {
    thousandSeparator = ',',
    decimalSeparator = '.',
    bool removeDecimals = false,
  }) {
    amount = double.parse('$amount');
    late String number;

    number = amount.toStringAsFixed(2);
    if (double.parse(number) == double.parse(number).round()) {
      number = double.parse(number).round().toString();
    }
    number = number.replaceAll('.', decimalSeparator!);
    String oldNum = number.split(decimalSeparator!)[0];
    number = number.contains(decimalSeparator!)
        ? decimalSeparator! + number.split(decimalSeparator!)[1]
        : '';
    for (int i = 0; i < oldNum.length; i++) {
      number = oldNum[oldNum.length - i - 1] + number;
      if ((i + 1) % 3 == 0 &&
          i < oldNum.length - (oldNum.startsWith('-') ? 2 : 1)) {
        number = thousandSeparator! + number;
      }
    }
    return number.contains('.')
        ? number
        : (removeDecimals ? number : '$number.00');
  }

  static String addCommas(dynamic number) {
    String numberWithCommas = number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );
    return numberWithCommas;
  }
}
class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
