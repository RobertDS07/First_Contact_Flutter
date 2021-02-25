import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  CustomTextField(this.controller, this.label);

  @override
  Widget build(context) {
    return TextField(
      controller: controller,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: (label)),
    );
  }
}
