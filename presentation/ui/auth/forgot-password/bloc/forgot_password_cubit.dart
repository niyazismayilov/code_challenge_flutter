import 'package:birbir/app/injection/get_it.dart';
import 'package:birbir/data/endpoint/security/verify_mobile.dart';
import 'package:birbir/data/exception/http_exception.dart';
import 'package:birbir/data/repository/security_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:birbir/presentation/components/extensions/string_x.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  final _mobileController = BehaviorSubject<String>();

  Function(String) get updateMobile => _mobileController.sink.add;

  String get mobile => "994" + _mobileController.value;

  final _securityRepository = getIt.get<SecurityRepository>();

  getSmsCode() async {
    emit(ForgotPasswordInProgress());

    if (!_mobileController.hasValue || !mobile.isValidPhoneNumber) {
      emit(ForgotPasswordFailure("Mobil nömrə düzgün formatda deyil"));
      return;
    }

    try {
      final input = VerifyMobileInput(mobile: mobile);
      final response = await _securityRepository.verifyMobile(input);

      emit(ForgotPasswordSuccess(
        mobile: mobile,
        smsCode: response.smsCode,
        message: "Mobil nömrənizə sms göndərildi",
      ));
    } on HttpException catch (e) {
      emit(ForgotPasswordFailure(e.message));
    }
  }

  @override
  Future<void> close() {
    _mobileController.close();
    return super.close();
  }
}
