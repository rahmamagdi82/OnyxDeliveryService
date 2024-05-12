part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailed extends LoginState {
  final String message;

  LoginFailed({required this.message});
}
