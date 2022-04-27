// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_integration/signin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Media Integration"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: loginUI(),
    );
  }

  Widget loginUI() {
    return Consumer<LoginController>(
      builder: (context, model, child) {
        if (model.userDetails != null) {
          return Center(
            child: loggedInUI(model),
          );
        } else {
          return loginControls(context);
        }
      },
    );
  }

 Widget loggedInUI(LoginController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.userDetails!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.userDetails!.displayName ?? ''),
        Text(model.userDetails!.email ?? ''),
        ActionChip(
          avatar: const Icon(Icons.logout),
          label: const Text("Logout"),
          onPressed: () {
            Provider.of<LoginController>(context, listen: false)
                .logOut();
          },
        )
      ],
    );
  }

 Center loginControls(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The Sparks Foundation',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'NerkoOne')),
          Image.asset("images/logo.png"),
           Text('Android Development Intern\n\t\t\t\t\t           Task #5',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'NerkoOne')),
          SizedBox(
          height: 50,
           ),
          GestureDetector(
          child: Image.asset(
            "images/google.png",
            width: 300,
          ),
          onTap: () {
            Provider.of<LoginController>(context, listen: false)
            .googleLogin();
          },
        ),
        const SizedBox(
          height: 10,
        ),
         GestureDetector(
          child: Image.asset(
            "images/fb.png",
            width: 300,
          ),
          onTap: () {
            Provider.of<LoginController>(context, listen: false)
            .facebookLogin();
          },
        ),
         const SizedBox(
          height: 10,
        ),
       GestureDetector(
          child: Image.asset(
            "images/twitter.png",
            width: 300,
          ),
          onTap: () {
            Provider.of<LoginController>(context, listen: false)
            .twitterLogin();
          },
        ),
      ]),
    );
  }
}
