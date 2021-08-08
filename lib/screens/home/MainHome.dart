import 'package:flutter/material.dart';
import 'package:note_app/screens/add_note/MainAddNote.dart';
import 'package:note_app/screens/home/HeaderHome.dart';
import 'package:note_app/screens/home/ListNotes.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderHome(),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        color: Colors.grey[900],
        child: ListNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return MainAddNote();
          }));
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.white,
      ),
    );
  }
}
