import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/services/auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent) {
      try {
        yield StartLoginState();
        User user = await authService(event.email, event.password);

        if (user != null) {
          yield SuccessLoginState(user);
        } else {
          yield ErrorLoginState('User or password incorrect.');
        }
      } catch (e) {
        yield ErrorLoginState('Oops, has occurred a error.');
      }
    }
  }
}
