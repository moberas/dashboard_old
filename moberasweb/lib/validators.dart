import 'package:string_validator/string_validator.dart';

import 'local_keys.dart';

/// Class of validation functions that the app will use
///   - This class should be used as a mixin using the `with` keyword
class Validators {
  final phoneNumberRegExp = RegExp(
      r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');

  final zipCodeRegExp = RegExp(r'^[0-9]{5}(?:-[0-9]{4})?$');

  final crmCodeRegExp = RegExp(r'^[0-9]{7}?$');

  String validateEmail(String value) {
    if (!isEmail(value.trim())) {
      return LocalKeys.invalid_email;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return LocalKeys.password_empty;
    } else if (value.length < 6) {
      return LocalKeys.password_short;
    }
    return null;
  }

  String validateCrm(String value) {
    if (!crmCodeRegExp.hasMatch(value.trim())) {
      return LocalKeys.invalid_crm;
    }
    return null;
  }

  bool isStringNull(String str) {
    return isNull(str);
  }
}
