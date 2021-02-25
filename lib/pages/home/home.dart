import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/login_bloc.dart';
import 'package:flutter_app/pages/Counter/Counter.dart';
import 'package:flutter_app/pages/home/components/CustomTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  static String routeName = 'HOME_PAGE';

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<LoginBloc>(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is StartLoginState)
        return Center(
          child: CircularProgressIndicator(),
        );

      if (state is SuccessLoginState) return Counter();

      if (state is ErrorLoginState) return SnackBar(content: Text(state.msg));

      return Scaffold(
          appBar: AppBar(
            title: Text('Login with bloc'),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(emailController, 'email'),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(passwordController, 'password'),
                Container(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () => bloc.add(
                      SignInEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    ),
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
