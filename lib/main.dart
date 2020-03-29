import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items = new List<String>.generate(30, (i)=> "Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible app"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index){
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction){
              items.removeAt(index);
             Scaffold.of(context).showSnackBar(SnackBar(content: Text("Dismissed"),
             behavior: SnackBarBehavior.floating,
             )); 
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text("${items[index]}"),
            ),
          );
        },
      ),
    );
  }
}