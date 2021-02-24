import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.amber,
      ),
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
  _ConvertorState createState() => _ConvertorState();
}

class _ConvertorState extends State<Convertor> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case (ConnectionState.none):
          case (ConnectionState.waiting):
            return Center(
              child: Text(
                'Carregando...',
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro...'),
              );
            }
            return CustomTextField('R\$', 'reais');
        }
      },
    );
  }
}

Future<Map> getData() async {
  http.Response res = await http.get('https://api.hgbrasil.com/finance');

  Map compiledRes = json.decode(res.body);

  return compiledRes;
}

class CustomTextField extends StatelessWidget {
  final String prefix, label;

  CustomTextField(this.prefix, this.label);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefix: Text(prefix),
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber)),
    );
  }
}
