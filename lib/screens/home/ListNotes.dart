import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/screens/edit_note/MainEditNote.dart';
import 'package:note_app/services/Database.dart';

class ListNotes extends StatefulWidget {
  const ListNotes({Key? key}) : super(key: key);

  @override
  _ListNotesState createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser != null
        ? FirebaseAuth.instance.currentUser
        : null;

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
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                    .collection("notes")
                    .where("userId", isEqualTo: user!.uid)
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if(snapshot.data!.docs.length == 0) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            "Data Not Found", 
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        );
                      } 
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                  return MainEditNote(documentId: docSnapshot.id,);
                                }));
                              },
                              child: ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    docSnapshot["title"],
                                    style: kSubHeaderText,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    docSnapshot["content"],
                                    style: TextStyle(color: Colors.grey),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                trailing: PopupMenuButton(
                                  color: Color.fromARGB(255, 71, 66, 66),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                                  ),
                                  itemBuilder: (_) => [
                                    PopupMenuItem(
                                      onTap: () {
                                        DatabaseService().deleteNote(docSnapshot.id);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("File Deleted"),
                                        ));
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete),
                                          Text(' Delete')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
                // ListTile(
                //   title: Text(
                //     'Ini Judul',
                //     style: kSubHeaderText,
                //   ),
                //   subtitle: Text(
                //     'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                //     style: TextStyle(color: Colors.grey),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   trailing: Icon(Icons.more_vert),
                // ),
                // ListTile(
                //   title: Text(
                //     'Ini Judul',
                //     style: kSubHeaderText,
                //   ),
                //   subtitle: Text(
                //     'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                //     style: TextStyle(color: Colors.grey),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   trailing: Icon(Icons.more_vert),
                // ),
                // ListTile(
                //   title: Text(
                //     'Ini Judul',
                //     style: kSubHeaderText,
                //   ),
                //   subtitle: Text(
                //     'loEsse laboris sunt voluptate ut proident ea minim reprehenderit velit commodo sunt quis anim.',
                //     style: TextStyle(color: Colors.grey),
                //     maxLines: 1,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                //   trailing: Icon(Icons.more_vert),
                // ),
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
