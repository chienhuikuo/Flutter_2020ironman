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
          title: Text('Succulent'),
          backgroundColor: Color.fromRGBO(250, 205, 75, 1.0),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('images/my_image1.jpg')
              )
            ),
        )
      )
      )
    );
  }
}

//--pubspec.yaml--
// flutter:
//   assets:
//     - images/
