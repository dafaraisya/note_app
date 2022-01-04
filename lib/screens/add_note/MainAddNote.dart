import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screens/home/MainHome.dart';
import 'package:note_app/services/Database.dart';

class MainAddNote extends StatefulWidget {
  const MainAddNote({Key? key}) : super(key: key);

  @override
  _MainAddNoteState createState() => _MainAddNoteState();
}

class _MainAddNoteState extends State<MainAddNote> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 30),
                        hintText: 'Title',
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        content = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: 'Write your note here...',
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ))),
                child: Text('Save'),
                onPressed: () async {
                  await DatabaseService().AddNote(title!, content!);
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return MainHome();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
