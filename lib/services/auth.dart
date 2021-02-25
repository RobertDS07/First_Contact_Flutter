import 'package:flutter_app/models/User.dart';

Future<User> authService(String email, String password) async {
  return await Future.delayed(Duration(seconds: 3), () {
    if (email == 'admin' && password == 'admin') return User(email, password);

    return null;
  });
}
