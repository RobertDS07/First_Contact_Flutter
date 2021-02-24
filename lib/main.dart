import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(primaryColor: Colors.white, hintColor: Colors.amber),
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Currency converter'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.monetization_on,
            size: 120,
            color: Colors.amber,
          ),
          Convertor()
        ],
      ),
    );
  }
}

class Convertor extends StatefulWidget {
  @override
  _ConvertorState createState() => _ConvertorState()
}

class _ConvertorState extends State<Convertor> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: null)
  }
}

Future<map> getData() {
  http.get()
}