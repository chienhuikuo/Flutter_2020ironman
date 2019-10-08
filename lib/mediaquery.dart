import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediaQuery',
      home: Scaffold(
        appBar: AppBar(title: const Text('MediaQuery')),
        body: Myfitbox(),
      ),
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        widthFactor: 0.8,
        heightFactor: myheight,
        child: DecoratedBox(
          decoration:BoxDecoration(
            color: Colors.pink[300],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text('現在方向是'+screenOrientation.toString(),style: Theme.of(context).textTheme.title),
                  Text('螢幕寬度是'+screenSizeWidth.toString()+' px',style: Theme.of(context).textTheme.title),
                  Text('像素比率是'+screenPixelRatio.toString(),style: Theme.of(context).textTheme.title),
              ],
            )
          )
        )
      )
    );
  }
}
