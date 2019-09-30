import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
          title: Text('Placeholder'),
          backgroundColor: Color.fromRGBO(250, 205, 75, 1.0),
        ),
        body: Stack(
          children: [
            Center(child: CircularProgressIndicator()),
            Center(
              child:FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                fadeInDuration: const Duration(seconds: 1),
                image: 'https://picsum.photos/350?image=9'
              )
            )
          ]
      )
      )
    );
  }
}

//--pubspec.yaml--
//dependencies:
//  transparent_image: ^1.0.0
