import 'package:birbir/presentation/shared/validators/validator.dart';

extension StringX on String {
  bool get isValidPhoneNumber {
    return Validator.isValidPhoneNumber(this);
  }

  bool get isValidEmail {
    return Validator.isValidEmail(this);
  }

  bool get isValidPassword {
    return Validator.isValidPassword(this);
  }
}
