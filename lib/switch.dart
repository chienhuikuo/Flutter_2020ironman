import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch light',
      home: Scaffold(
        appBar: AppBar(title: const Text('Switch light')),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SwitchListTile(
        title: const Text('Lights'),
        value: _lights,
        onChanged: (bool value) {
          setState(() {
            _lights = value;
          });
        },
        secondary: _lights ?const Icon(Icons.lightbulb_outline,color: Colors.yellow,):const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}