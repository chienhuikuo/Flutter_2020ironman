import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App bar'),
          backgroundColor: Color(0xFFFF143836),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Friends('Jerry'),
              Friends('Mary'),
              Friends('Polly'),
              Friends('Jay'),
              Friends('Tony'),
            ],
          ),
        )
      )
    );
  }
}

class Friends extends StatelessWidget {
  final String name;
  const Friends(this.name);

  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFF355d5c),
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xFFFFe5fbef))
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 100,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}