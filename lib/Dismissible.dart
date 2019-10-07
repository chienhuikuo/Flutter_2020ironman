import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}"); //創多筆列表資料
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'slide remove',
      home: Scaffold(
        appBar: AppBar(
          title: Text('slide remove'),
        ),
        body: ListView.builder(  //渲染長列表
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item),   //每一個Dismissible都必須有專屬的key，讓Flutter能夠辨識
              onDismissed: (direction) {   //項目移除後要做什麼事
                setState(() {   //從data中移除項目
                  items.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$item 掰掰"),
                    duration: Duration(milliseconds: 500), //預設四秒有點太慢了
                  )
                );  //顯示Snackbar
              },
              background: Container(color: Colors.red), //滑動時跑出來的背景色
              child: ListTile(title: Text('$item')),
            );
          }
      )
      
      )
      
    );
  }
}

