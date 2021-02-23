import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'A simple calculator',
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A simple calculator'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic result = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            color: Colors.grey,
            height: 100,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '$result',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
              ),
            )),
        GridView.count(
          padding: const EdgeInsets.all(10),
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [CustomButton('1')],
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final hotkey;

  CustomButton(this.hotkey);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          splashColor: Colors.grey.withAlpha(40),
          onTap: () {
            print('Card tapped.');
          },
          child: Center(
            child: Text('$hotkey'),
          )),
    );
  }
}
