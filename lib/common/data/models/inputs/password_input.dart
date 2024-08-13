import '../../../utils/input_util.dart';

enum PasswordInputValidationError { empty }

class PasswordInput extends InputField<String, PasswordInputValidationError> {
  const PasswordInput.pure([super.value = '']) : super.pure();
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputValidationError? validator(String value) {
    if (value.isEmpty) return PasswordInputValidationError.empty;
    return null;
  }
}
