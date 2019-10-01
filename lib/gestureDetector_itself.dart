import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Interaction',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tap Interaction'),
        ),
        body: Center(
          child: MyTapbox(),
        ),
      ),
    );
  }
}

class MyTapbox extends StatefulWidget {
  @override
  MyTapboxState createState() => MyTapboxState();
}

class MyTapboxState extends State<MyTapbox> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active; //state切換
    });
  }

  Widget build(BuildContext context) { //對這個widget偵測點擊
    return GestureDetector(
      onTap: _handleTap,  //點擊Widget時切換布林值
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',  //true:'Active', false:'Inactive'
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen : Colors.pink,  //true:'green', false:'grey'
        ),
      ),
    );
  }
}
