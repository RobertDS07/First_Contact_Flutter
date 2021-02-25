part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class StartLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  final User user;

  SuccessLoginState(this.user);
}

class ErrorLoginState extends LoginState {
  final String msg;

  ErrorLoginState(this.msg);
}
