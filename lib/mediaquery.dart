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
    
    var screenSizeWidth = MediaQuery.of(context).size.width;
    var screenOrientation = MediaQuery.of(context).orientation;
    var screenPixelRatio = MediaQuery.of(context).devicePixelRatio;
    var myheight;
    
    if(screenSizeWidth>414){
      myheight=0.8;
    }else{
      myheight=0.5;
    }
    return Container(
      alignment: Alignment.center,
      child: FractionallySizedBox(  //FractionallySizedBox always align:center
        widthFactor: 0.7,
        heightFactor: myheight,
        child: DecoratedBox(
          decoration:BoxDecoration(
            color: Colors.pink[300],
          ),
          child: Center(
            child: RichText(
              textAlign: TextAlign.left,
              softWrap: true,
              text: TextSpan(
                style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(text:'現在方向是'+screenOrientation.toString()),
                  TextSpan(text: '螢幕寬度是'+screenSizeWidth.toString()+' px'),
                  TextSpan(text: '像素比率是'+screenPixelRatio.toString()),
                ]
                )
            )
          )
        )
      )
      
      
    );
    
    
  }

}