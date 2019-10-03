import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}"); //生成list
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'slide remove',
      home: Scaffold(
        appBar: AppBar(
          title: Text('slide remove'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
          }
      )
      
      )
      
    );
  }
}

