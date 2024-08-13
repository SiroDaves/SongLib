import '../../../utils/input_util.dart';

enum CodeInputValidationError { invalid }

class CodeInput extends InputField<String, CodeInputValidationError> {
  const CodeInput.pure([super.value = '']) : super.pure();
  const CodeInput.dirty([super.value = '']) : super.dirty();

  @override
  CodeInputValidationError? validator(String value) {
    return value.length == 4 ? null : CodeInputValidationError.invalid;
  }
}
