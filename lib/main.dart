// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items =
      List<String>.generate(60, (index) => "Elements No. ${index + 1}");

  MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Swipe To Dismiss"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            return new Dismissible(
              key: Key(items[index]),
              child: ListTile(
                title: Text(items[index]),
              ),
              onDismissed: ((direction) {
                items.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Your item has been dismissed")));
              }),
              background: Container(
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
