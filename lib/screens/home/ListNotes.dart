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
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff2D2D2D),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Ini Judul',
                    style: kSubHeaderText,
                  ),
                  subtitle: Text(
                    'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
                ListTile(
                  title: Text(
                    'Ini Judul',
                    style: kSubHeaderText,
                  ),
                  subtitle: Text(
                    'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
                ListTile(
                  title: Text(
                    'Ini Judul',
                    style: kSubHeaderText,
                  ),
                  subtitle: Text(
                    'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                    style: TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Icon(Icons.more_vert),
                ),
              ],
            ),
          )
        ],
      ),
    );
    // return GridView.count(
    //   crossAxisCount: 2,
    //   childAspectRatio: widthScreen/heightScreen*1.4,
    //   children: List.generate(10, (index) {
    //     return Center(
    //       child: InkWell(
    //         onTap: () {},
    //         child: Container(
    //           margin: EdgeInsets.all(5),
    //           padding: EdgeInsets.only(top: 10, left: 15, right: 15),
    //           width: 280,
    //           height: 400,
    //           decoration: BoxDecoration(
    //             color: Colors.grey[900],
    //             borderRadius: BorderRadius.circular(15),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Flow Apps", style: kHeaderText,),
    //               SizedBox(height: 10,),
    //               Text("loreLaboris voluptate nulla laborum ut laboris in adipisicing ipsum mollit est quis aute aliquip adipisicing.Sit occaecat aliquip non irure dolore magna exercitation velit ut commodo aliquip officia excepteur.", style: kParagraphText,),
    //             ],
    //           ),
    //         ),
    //       ),
    //     );
    //   }),
    // );
  }
}
