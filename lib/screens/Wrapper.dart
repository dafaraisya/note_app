import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screens/home/MainHome.dart';
import 'package:note_app/screens/signin/MainSignIn.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator()
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something went error'),
            );
          } else if (snapshot.hasData) {
            return MainHome();
          } else {
            return MainSignIn();
          }
        },
      ),
    );
  }
}
