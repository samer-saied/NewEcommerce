part of 'authapp_cubit.dart';

@immutable
abstract class AuthappState {}

class AuthappInitial extends AuthappState {}

class AuthappIoading extends AuthappState {}

class AuthappLogin extends AuthappState {}

class AuthappLogout extends AuthappState {}

class AuthappError extends AuthappState {
  final String error;

  AuthappError(this.error);
}

class AuthappRegister extends AuthappState {}

class AuthappVerPhone extends AuthappState {}
