import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OrientationList',
      home: OrientationList(),
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.purple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OrientationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OrientationList'),backgroundColor: Colors.purple[800],),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(100, (index) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 3/2,
                      child: Image.network(
                        'https://picsum.photos/200',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center
                    )
                  ],
                )
              );
            }),
          );
        },
      ),
    );
  }
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