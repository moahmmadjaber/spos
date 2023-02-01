part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginComplete extends LoginState{
  final UserModel model;
  LoginComplete(this.model);
}

class LoginError extends LoginState{
  final String err;
  LoginError(this.err);
}

