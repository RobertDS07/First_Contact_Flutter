import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Contador de pessoas',
      home: Stack(
        children: [
          Opacity(
            opacity: .3,
            child: Image.asset(
              "assets/restaurante.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
          ),
          Container(
            child: Contador(),
          )
        ],
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total de pessoas $pessoas',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.none),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: _addPessoas,
                child: Text(
                  '+1',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              FlatButton(
                onPressed: _removePessoas,
                child: Text('-1',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              )
            ],
          ),
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
    style: TextStyle(
        fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
  );
}
