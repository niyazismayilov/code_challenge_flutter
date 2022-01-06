import 'package:birbir/app/injection/get_it.dart';
import 'package:birbir/data/endpoint/security/change_password.dart';
import 'package:birbir/data/exception/http_exception.dart';
import 'package:birbir/data/repository/security_repository.dart';
import 'package:birbir/presentation/shared/validators/validation_state.dart';
import 'package:birbir/presentation/shared/validators/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:birbir/presentation/components/extensions/string_x.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final _mobileController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

  Stream<ValidationState> get passwordValidationStream {
    return _passwordController.stream.transform(Validator.validatePassword);
  }

  Stream<ValidationState> get passwordConfirmValidationStream {
    return _passwordConfirmController.stream.transform(Validator.validatePassword);
  }

  Stream<ValidationState> get combinedValidationStream {
    return Rx.combineLatest2(passwordValidationStream, passwordConfirmValidationStream, (a, b) {
      if (a == ValidationState.valid && b == ValidationState.valid && password == passwordConfirm) {
        return ValidationState.valid;
      } else {
        return ValidationState.invalid;
      }
    });
  }

  Function(String) get updatePassword => _passwordController.sink.add;
  Function(String) get updatePasswordConfirm => _passwordConfirmController.sink.add;
  Function(String) get setMobile => _mobileController.sink.add;

  String get mobile => _mobileController.value;
  String get password => _passwordController.value;
  String get passwordConfirm => _passwordConfirmController.value;

  final _securityRepository = getIt.get<SecurityRepository>();

  changePassword() async {
    emit(ChangePasswordInProgress());

    if (!_passwordController.hasValue || !password.isValidPassword) {
      emit(ChangePasswordFailure("Zəhmət olmasa, yeni şifrə daxil edin"));
      return;
    }

    if (!_passwordConfirmController.hasValue || !passwordConfirm.isValidPassword) {
      emit(ChangePasswordFailure("Zəhmət olmasa, yeni şifrənin təkrarını daxil edin"));
      return;
    }

    if (password != passwordConfirm) {
      emit(ChangePasswordFailure("Şifrələr uyğunlaşmır"));
      return;
    }

    try {
      final input = ChangePasswordInput(mobile: mobile, newPassword: password);
      await _securityRepository.changePassword(input);
      emit(ChangePasswordSuccess(message: "Şifrəniz yeniləndi"));
    } on HttpException catch (e) {
      emit(ChangePasswordFailure(e.message));
    }
  }

  @override
  Future<void> close() {
    _mobileController.close();
    _passwordController.close();
    _passwordConfirmController.close();
    return super.close();
  }
}
