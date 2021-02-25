import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  static String routeName = 'COUNTER_PAGE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter with bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('oi'),
      ),
    );
  }
}
