import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'hello',
      home: MyHero()
    );
  }
}
class MyHero extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 means normal animation speed.
    var screenWidth = MediaQuery.of(context).size.width;
    var rowWidth = screenWidth-24;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero List'),
      ),
      body: Container(  //list頁，push推入換頁
        width: screenWidth,
        padding: EdgeInsets.all(8.0),
        color: Colors.yellow[50],
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: PhotoHero(
              photo: 'assets/images/succulent2.jpg',
              width: rowWidth/3,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<void>( 
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Hero Page'),
                        backgroundColor: Colors.lightGreen,
                      ),
                      body: Center(
                        child: PhotoHero(
                          photo: 'assets/images/succulent2.jpg',
                          width: 300.0,
                          onTap: () {
                            Navigator.of(context).pop(); 
                          },
                        ),
                      ),
                    );
                  }
                ));
              },
            ),
          ),
          SizedBox(width: 8,),
          Align(
            alignment: Alignment.topRight,
            child: PhotoHero(
            photo: 'assets/images/succulent.jpg',
            width: rowWidth/3*2,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<void>( 
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Hero Page'),
                      backgroundColor: Colors.lightGreen,
                    ),
                    body: Center(
                      child: PhotoHero(
                        photo: 'assets/images/succulent.jpg',
                        width: 300.0,
                        onTap: () {
                          Navigator.of(context).pop(); 
                        },
                      ),
                    ),
                    backgroundColor: Colors.yellow[50],
                  );
                }
              ));
            },
          ),
          )
        ]
          
        ),
      )
      
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
