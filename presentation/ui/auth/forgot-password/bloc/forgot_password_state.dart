part of 'forgot_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordInProgress extends ForgotPasswordState {}

class ForgotPasswordSplash extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final String mobile;
  final String smsCode;
  final String message;

  ForgotPasswordSuccess({required this.mobile, required this.smsCode, required this.message});

  @override
  List<Object> get props => [mobile, smsCode, message];
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String message;

  ForgotPasswordFailure(this.message);

  @override
  List<Object> get props => [message];
}
