import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fractionally Sized Box',
      home: Scaffold(
        appBar: AppBar(title: const Text('Fractionally Sized Box')),
        body: Myfitbox(),
      ),
    );
  }
}

class Myfitbox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft, //在父層控制FractionallySizedBox位置
      child: FractionallySizedBox(  //FractionallySizedBox always align:center
        widthFactor: 0.7,
        heightFactor: 0.8,
        child: DecoratedBox(
          decoration:BoxDecoration(
            color: Colors.pink[300],
          ),
        
        )
      )
    );
  }

}