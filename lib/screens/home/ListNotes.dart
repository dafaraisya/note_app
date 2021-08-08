import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class ListNotes extends StatefulWidget {
  const ListNotes({Key? key}) : super(key: key);

  @override
  _ListNotesState createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: widthScreen/heightScreen*1.4,
      children: List.generate(10, (index) {
        return Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              width: 280,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Flow Apps", style: kHeaderText,),
                  SizedBox(height: 10,),
                  Text("loreLaboris voluptate nulla laborum ut laboris in adipisicing ipsum mollit est quis aute aliquip adipisicing.Sit occaecat aliquip non irure dolore magna exercitation velit ut commodo aliquip officia excepteur.", style: kParagraphText,),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
