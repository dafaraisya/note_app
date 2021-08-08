import 'package:flutter/material.dart';

class MainAddNote extends StatefulWidget {
  const MainAddNote({ Key? key }) : super(key: key);

  @override
  _MainAddNoteState createState() => _MainAddNoteState();
}

class _MainAddNoteState extends State<MainAddNote> {
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
              child: AddNoteForm(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                child: Text('Save'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddNoteForm extends StatelessWidget {
  const AddNoteForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Title',
            border: InputBorder.none
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: 'Write your note here...',
            border: InputBorder.none
          ),
        ),
      ],
    );
  }
}

