import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context){
    return MaterialApp(  
      title: 'My App',
      initialRoute: '/', //加route
      routes: {
        '/': (context) => MyHomePage(),
        '/sign': (context) => SignInPage(),  
        '/product': (context) => ProductPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF18b6b2),
      ),
      drawer: MyDrawer(),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Friends('Jerry'),
            Friends('Mary'),
            Friends('Polly'),
            Friends('Jay'),
            Friends('Tony'),
          ],
        ),
      )
    );
  }
}

class SignInPage extends StatelessWidget { 
   @override
   Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
          backgroundColor: Color(0xFF18b6b2),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Text(
            'Sign in / Sign up page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
   }
}

class ProductPage extends StatelessWidget { 
  @override
   Widget build(BuildContext context) {
     return Scaffold( 
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Color(0xFF18b6b2),
      ),
      drawer: MyDrawer(),
      body: Center( 
        child: (
            _buildGrid()
        ),
      )
    );
   }
}

//Drawer
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
              ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF18b6b2),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text('Sign in'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/sign');
            },
          ),
          ListTile(
            title: Text('Product'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/product');
            },
          )
        ],
      ),
    );
  }
}

//product grid
Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30)
  );
List<Container> _buildGridTileList(int count) => List.generate(
  count, (i) => Container(child: Image.network('https://picsum.photos/200'))
  );

//Homepage List
class Friends extends StatelessWidget {
  final String name;
  const Friends(this.name);

  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xFFFF355d5c),
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xFFFFe5fbef))
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: 414,
        height: 100,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}