import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locate_it_user_1/screens/drivers.dart';
import 'package:locate_it_user_1/screens/emergency.dart';

import '../screens/about_page.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          // hoverColor: Colors.white,
          splashColor: Colors.grey[300],
          onTap: (() {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const AboutPage())));
          }),
          child: const ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            // ignore: prefer_const_constructors
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                // fontFamily: 'NewFont'
              ),
            ),
          ),
        ),
        // const Divider(
        //   thickness: 1,
        //   color: Colors.grey,
        // ),
        InkWell(
          onTap: (() {
            Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => const DriverList())));
          }),
          child: const ListTile(
            leading: Icon(
              Icons.co_present_rounded,
              color: Colors.black,
            ),
            // ignore: prefer_const_constructors
            title: Text(
              'Drivers Info',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                // fontFamily: 'NewFont'
              ),
            ),
            onTap: null,
          ),
        ),
        InkWell(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const EmergencyNumber())));
          }),
          child: const ListTile(
            leading: Icon(
              Icons.contact_phone,
              color: Colors.black,
            ),
            // ignore: prefer_const_constructors
            title: Text(
              'Emergency Contacts',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                // fontFamily: 'NewFont'
              ),
            ),
            onTap: null,
          ),
        ),
        InkWell(
          onTap: (() {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          }),
          child: const ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.black,
            ),
            // ignore: prefer_const_constructors
            title: Text(
              'Exit',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                // fontFamily: 'NewFont'
              ),
            ),
            onTap: null,
          ),
        ),
      ],
    );
  }
}
