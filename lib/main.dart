import 'package:flutter/material.dart';
import 'package:note_app/Scence/ListItem.dart';
import 'Scence/NoteList.dart';

void main(){
  runApp(Note_App());
}

class Note_App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "NoteKeepar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: new NoteList(),
    );
  }
}
