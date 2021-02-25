import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Counter/Counter.dart';
import 'package:flutter_app/pages/home/home.dart';

Map<String, WidgetBuilder> getRoutes() => ({
      Home.routeName: (BuildContext context) => Home(),
      Counter.routeName: (BuildContext context) => Counter(),
    });
