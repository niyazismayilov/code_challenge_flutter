import 'dart:async';

import 'package:birbir/presentation/shared/validators/validation_state.dart';

class Validator {
  static RegExp get _regExpEmail => RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (isValidEmail(email)) {
      sink.add(email.trim());
    } else {
      sink.addError('Valid Email Required');
    }
  });

  static final validatePassword = StreamTransformer<String, ValidationState>.fromHandlers(handleData: (password, sink) {
    if (password.trim().isEmpty) {
      sink.add(ValidationState.unknown);
    } else if (isValidPassword(password)) {
      sink.add(ValidationState.valid);
    } else {
      sink.add(ValidationState.invalid);
    }
  });

  static bool isValidEmail(String email) => _regExpEmail.hasMatch(email.trim());
  static bool isValidPassword(String password) => password.length >= 4;
  static bool isValidPhoneNumber(String number) => number.startsWith("994") && number.length == 12;
}
