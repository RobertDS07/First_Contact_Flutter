import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Contador de pessoas',
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(child: Contador()),
        ),
      )));
}

class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int pessoas = 0;

  void _addPessoas() {
    setState(() {
      pessoas += 1;
    });
  }

  void _removePessoas() {
    setState(() {
      if (pessoas == 0) return;
      pessoas -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total de pessoas $pessoas',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: [
            RaisedButton(
              onPressed: _addPessoas,
              child: Text('+1'),
            ),
            RaisedButton(
              onPressed: _removePessoas,
              child: Text('-1'),
            )
          ],
        ),
        status(pessoas)
      ],
    );
  }
}

Widget status(int pessoas) {
  String statusText =
      pessoas >= 0 && pessoas <= 10 ? 'Pode entrar!' : 'Estamos cheio!';
  return Text(
    statusText,
    style: TextStyle(fontSize: 20),
  );
}
