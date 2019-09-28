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

class ProductsCard extends StatelessWidget {
  final String name;
  const ProductsCard(this.name);

  @override
  Widget build(BuildContext context){
    return Card(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name),
                SizedBox(height: 4.0),
                Text(name+' Secondary Text'),
              ],
            ),
          )
        ]
      )
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;  
  static List _widgetOptions = <Widget>[ //用list做 每頁內容
    GridView.count(
      crossAxisCount: 1,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: [
        ProductsCard('women1'),
        ProductsCard('women2'),
        ProductsCard('women3'),
        ProductsCard('women4'),
      ]
    ),
    GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children:[
        ProductsCard('men1'),
        ProductsCard('men2'),
        ProductsCard('men3'),
        ProductsCard('men4'),
        ProductsCard('men5'),
        ProductsCard('men6'),
      ]
    ),
    GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0 / 9.0,
      children: [
        ProductsCard('kids1'),
        ProductsCard('kids2'),
        ProductsCard('kids3'),
        ProductsCard('kids4'),
        ProductsCard('kids5'),
        ProductsCard('kids6'),
        ProductsCard('kids7'),
        ProductsCard('kids8'),
        ProductsCard('kids9'),
      ]
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
        child: _widgetOptions.elementAt(_selectedIndex),
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
