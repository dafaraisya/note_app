// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:note_app/constants.dart';
import 'package:note_app/provider/GoogleSigIn.dart';
import 'package:provider/provider.dart';

class HeaderHome extends StatefulWidget implements PreferredSizeWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
          color: Colors.grey[900],
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text(
                      'Notes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     image: DecorationImage(
                  //       image: NetworkImage(user.photoURL!),
                  //     )
                  //   ),
                  // ),
                  // SizedBox(width: 20,),
                  // Expanded(
                  //   child: Text(
                  //     user.displayName!,
                  //     style: kSubHeaderText,
                  //   ),
                  // ),
                  // SizedBox(width: 100,),
                  IconButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      provider.logout();
                    },
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    )
                  )
                ],
              )
            ],
          ),
        ));
  }
}
