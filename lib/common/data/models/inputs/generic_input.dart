import '../../../utils/input_util.dart';

enum GenericInputValidationError { empty }

class GenericInput extends InputField<String, GenericInputValidationError> {
  const GenericInput.pure([super.value = '']) : super.pure();
  const GenericInput.dirty([super.value = '']) : super.dirty();

  @override
  GenericInputValidationError? validator(String value) {
    if (value.isEmpty) return GenericInputValidationError.empty;
    return null;
  }
}
