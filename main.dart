import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsFeed'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return FScreen(orientation: orientation);
        },
      ),
    );
  }
}

class FScreen extends StatelessWidget {
  final Orientation orientation;

  FScreen({required this.orientation});

  @override
  Widget build(BuildContext context) {
    return orientation == Orientation.portrait
        ? ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            width: 150,
            height: 150,
            child: Image.network(
              'https://via.placeholder.com/150',
            ),
          ),
        );
      },
    )
        : GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            height: 150,
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );

  }
}



