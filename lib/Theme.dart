import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //全域Theme
      title: 'hello',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 133, 127, 1.0),
        accentColor: Color.fromRGBO(250, 205, 75, 1.0),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          title: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Color.fromRGBO(120, 80, 10, 1)),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Friends'),
          backgroundColor: Color.fromRGBO(35, 155, 215, 1.0),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
        color: Theme.of(context).accentColor,
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.white)
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 414,
        height: 100,
        child: Column(
          children: <Widget>[
            Text(
              name,
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(height: 4.0),
            Text(
              name+'\'s phone number',
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        )
      ),
    );
  }
}
