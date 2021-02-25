import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app/pages/home/home.dart';
import 'package:flutter_app/routes.dart';

import 'package:flutter_app/bloc/login_bloc.dart';

void main() => runApp(MaterialApp(
      title: 'Testing routes and bloc',
      routes: getRoutes(),
      home: MultiBlocProvider(
        providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
        child: Home(),
      ),
    ));
