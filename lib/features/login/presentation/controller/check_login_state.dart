part of 'check_login_cubit.dart';

abstract class CheckLoginState {}

class CheckLoginInitial extends CheckLoginState {}
class CheckLoginSuccess extends CheckLoginState {
  final UserEntity user;

  CheckLoginSuccess({required this.user});

}
class CheckLoginFailed extends CheckLoginState {
  final String message;

  CheckLoginFailed({required this.message});

}
