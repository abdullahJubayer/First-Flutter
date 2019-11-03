import 'package:flutter/material.dart';

void main(){
  runApp(new App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: Scaffold(
        appBar: new AppBar(title: new Text("Main Page"),
        ),
        body: new Center(child: new Text("This is First Page"),),
      ),
    );
  }
}