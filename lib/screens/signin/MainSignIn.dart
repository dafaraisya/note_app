import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/provider/GoogleSigIn.dart';
import 'package:provider/provider.dart';

class MainSignIn extends StatefulWidget {
  const MainSignIn({Key? key}) : super(key: key);

  @override
  _MainSignInState createState() => _MainSignInState();
}

class _MainSignInState extends State<MainSignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Spacer(),
            FlutterLogo(size: 120,),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "Hey There, \nWelcome Back",
                  style: TextStyle(
                    fontSize: 24
                  )
                ),
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "Login with your google account to continue",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                  )
                ),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
              ),
              icon: FaIcon(FontAwesomeIcons.google, size: 20,),
              label: Text('Sign In with Google'),
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.login();
              },
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                text: "\u00a9 Copyright 2021. All rights reserved"
              ),
            )
          ],
        ),
      ),
    );
  }
}
