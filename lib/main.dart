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
        backgroundColor: Colors.black,
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

  // criar uma var para pegar os valores digitados apenas para mostrar a cima do resultado para o user enquanto isso anoto os numeros digitados em uma list e as operações digitadas em outro

  static List<Map> skeleton = [
    {'hotkey': 'C', 'action': () => null},
    {'hotkey': Icons.arrow_back_ios_outlined, 'action': () => null},
    {'hotkey': '%', 'action': () => null},
    {'hotkey': 'X', 'action': () => null},
    {'hotkey': '-', 'action': () => null},
    {'hotkey': '+', 'action': () => null},
    ...List.generate(
        3, (index) => ({'hotkey': '${index + 1}', 'action': () => null})),
    ...List.generate(
        3, (index) => ({'hotkey': '${index + 4}', 'action': () => null})),
    ...List.generate(
        3, (index) => ({'hotkey': '${index + 7}', 'action': () => null})),
    {'hotkey': '.', 'action': () => null},
    {'hotkey': '0', 'action': () => null},
    {'hotkey': '=', 'action': () => null},
  ];

  final List<Widget> hotkeys =
      skeleton.map((e) => CustomButton(e['hotkey'])).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.black,
          height: 100,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '$result',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Divider(
          color: Colors.grey,
          height: 1,
        ),
        Container(
          color: Colors.black,
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.height / 568,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: hotkeys,
          ),
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
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        splashColor: Colors.grey.withAlpha(40),
        onTap: () {
          print('Card tapped.');
        },
        child: Center(
          child: hotkey is String
              ? Text(
                  '$hotkey',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              : Icon(
                  hotkey,
                  size: 40,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
