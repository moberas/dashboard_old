import 'package:quick_form/quick_form.dart';
import 'package:string_validator/string_validator.dart';

/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(
      r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');

  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  final crmCodeRegExp = RegExp(r'^[0-9]{7}?$');

  static final _justNumbersRegExp = RegExp(r'^[0-9]+$');

  String validateEmail(String value) {
    if (!isEmail(value.trim())) {
      return 'Email inválido';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Email inválido';
    } else if (value.length < 6) {
      return 'Email inválido';
    }
    return null;
  }

  String validateCrm(String value) {
    if (!crmCodeRegExp.hasMatch(value.trim())) {
      return 'Email inválido';
    }
    return null;
  }

  static String validateOrder(FormHelper helper, String value,
      {String defaultOutput}) {
    if (!_justNumbersRegExp.hasMatch(value)) {
      return 'O campo ordem deve conter apenas números';
    }
    return defaultOutput;
  }

  bool isStringNull(String str) {
    return isNull(str);
  }
}
