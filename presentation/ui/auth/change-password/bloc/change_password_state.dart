part of 'change_password_cubit.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordInProgress extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  ChangePasswordSuccess({ required this.message});

  @override
  List<Object> get props => [message];
}

class ChangePasswordFailure extends ChangePasswordState {
  final String message;

  ChangePasswordFailure(this.message);

  @override
  List<Object> get props => [message];
}
