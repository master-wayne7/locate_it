// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "About Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 158, 239, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'About',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Moto:',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Text(
              '''The moto of our application is to provide you the live location of transport vehicles which you are concerned of. ''',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
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
              '''Team Synergy''',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            Text(
                'Team Members:-\n-Priyansh Saxena\n-Narendra Patel\n-Ronit Rameja\n-Riya Ameta\n-Vansh Arora\n-Vikas Sahu',
                style: TextStyle(color: Colors.black, fontSize: 15))
          ],
        ),
      ),
    );
  }
}
