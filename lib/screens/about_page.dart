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
          title: const Text(
            "About Page",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(158, 239, 255, 1),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Version:',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                const Text(
                  'V1.0.0',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Made by:',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                const Text(
                  '''Synergy''',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                    'Team Members:-\n-Priyansh Saxena\n-Narendra Patel\n-Ronit Rameja\n-Riya Ameta\n-Vansh Arora\n-Vikas Sahu',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Feedback:',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        '''Give your valuable feedbacks and suggestion on this email:  ''',
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                        text: 'synergypnrrvv@gmail.com',
                        style: const TextStyle(
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
              child: const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage('assets/SYNERGY LOGO.png')),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
