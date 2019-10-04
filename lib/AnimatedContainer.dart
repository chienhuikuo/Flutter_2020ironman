import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Animation1',
      home: Scaffold(
        // appBar: AppBar(title: Text('Animation1')),
        body: MyStateful(),
      ),
    );
  } 
}


class MyStateful extends StatefulWidget{
  @override
  MyStatefulState createState() => MyStatefulState();
}

class MyStatefulState extends State<MyStateful>{
  bool selected = false;
  
  @override
  Widget build(BuildContext context){
    var screenSizeWidth = MediaQuery.of(context).size.width;
    var screenSizeHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        setState((){
          selected = !selected;
        });
      },
      child: Center(
          child: AnimatedContainer(
            width: selected ? screenSizeWidth : 200,
            height: selected ? screenSizeHeight : 50,
            color: selected ? Colors.red[200] : Colors.lightGreen[600],
            alignment: Alignment.center,
            duration: Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            child: (
              Text('Click Me!', 
                style: TextStyle(
                  fontSize: selected ? 0:24,
                  color: selected ? Color.fromRGBO(255, 255, 255, 0): Color.fromRGBO(255, 255, 255, 1),
                ),
              )
            ),
          )
      )
    );
  }
}