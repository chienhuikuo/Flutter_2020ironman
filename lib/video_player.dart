import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Video'),
          backgroundColor: Colors.deepOrange[700],
        ),
        body: MyStateful(),
      ),
    );
  }
}

class MyStateful extends StatefulWidget{
  MyStateful({Key key}) : super(key: key);
  @override
  _State createState() => _State();
}
class _State extends State<MyStateful>{
  VideoPlayerController _controller;

  @override
  void initState() { //初始化controller
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    super.initState();
  }

  @override
  void dispose() {  //銷毀controller
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.initialize();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(   //影片呈現等比例樣子
              aspectRatio: 16/9,
              child: VideoPlayer(_controller),
            ),
            FloatingActionButton(  //播放按鈕
              backgroundColor: Colors.white24,
              elevation: 0, //shadow default
              highlightElevation: 0,  //shadow click
              onPressed: () {  //設定點擊狀態
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        )
        
      ),
      
    );
  }
}
