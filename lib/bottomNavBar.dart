import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context){
    return MaterialApp(  
      title: 'My App',
      home: MyStatefulWidget()
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(); 
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;  //預設index
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold); //textstyle
  static const List<Widget> _widgetOptions = <Widget>[ //用list做 每頁內容
    Text(
      'Index 0: Women',
      style: optionStyle,
    ),
    Text(
      'Index 1: Men',
      style: optionStyle,
    ),
    Text(
      'Index 2: Kids',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) { //onTap換index
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Color(0xFF18b6b2),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), //list拿進來用
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Women'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text('Men'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_care),
            title: Text('Kids'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}