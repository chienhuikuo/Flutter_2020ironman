import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap Interaction',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tap Interaction'),
        ),
        body: Center(
          child: ParentTap(), //應放StatefulWidget ParentTap
        ),
      ),
    );
  }
}

class ParentTap extends StatefulWidget {
  @override
  ParentTapState createState() => ParentTapState();
}

class ParentTapState extends State<ParentTap> {
  bool _active = false;

  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue; //state切換
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(110, 80, 10, 1),
      ),
      child: MyTapbox(
        active: _active,
        onChanged: _handleTap,
      ),
    );
  }
}

class MyTapbox extends StatelessWidget{
  MyTapbox({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,  //點擊Widget時切換布林值
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',  //true:'Active', false:'Inactive'
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],  //true:'green', false:'grey'
        ),
      ),
    );
  }
}
