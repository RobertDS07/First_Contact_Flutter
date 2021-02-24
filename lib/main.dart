import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: 'Currency converter',
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.amber,
      ),
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
  final reaisController = TextEditingController();
  final euroController = TextEditingController();

  void onRealChange(value, AsyncSnapshot res) {
    double buyPrice = res.data['results']['currencies']['EUR']['buy'];

    euroController.value =
        TextEditingValue(text: '${double.parse(value) * buyPrice}');
  }

  void onEuroChange(value, AsyncSnapshot res) {
    double buyPrice = res.data['results']['currencies']['EUR']['buy'];

    reaisController.value =
        TextEditingValue(text: '${double.parse(value) * buyPrice}');
  }

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
            return (Column(
              children: [
                CustomTextField('R\$ ', 'Reais', reaisController,
                    (value) => onRealChange(value, snapshot)),
                CustomTextField('€ ', 'Euros', euroController,
                    (value) => onEuroChange(value, snapshot))
              ],
            ));
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
  final controller, onChange;

  CustomTextField(this.prefix, this.label, this.controller, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefix: Text(prefix),
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
