// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: Text(
          "About Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Version:',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Text(
                'V1.0.0',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Made by:',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Text(
                '''Synergy''',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                  'Team Members:-\n-Priyansh Saxena\n-Narendra Patel\n-Ronit Rameja\n-Riya Ameta\n-Vansh Arora\n-Vikas Sahu',
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              SizedBox(
                height: 20,
              ),
              Text(
                'Feedback:',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              RichText(
                text: TextSpan(
                  text:
                      '''Give your valuable feedbacks and suggestion on this email:  ''',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'synergypnrrvv@gmail.com',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // ignore: deprecated_member_use
                          launch('mailto:synergypnrrvv@gmail.com');
                        },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image(image: AssetImage('assets/SYNERGY LOGO.png')),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
