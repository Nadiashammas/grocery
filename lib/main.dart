import 'package:flutter/material.dart';
import 'package:store_app/screens/fruits_and_vegetables.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Zarqa Store'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Fruits and Vegetables'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StoreHome()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruits and Vegetables Store"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
