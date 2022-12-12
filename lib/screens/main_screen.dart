// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locate_it_user_1/bodies/ann.dart';

import '../bodies/maps.dart';
// import '../bodies/notification.dart';
import '../bodies/profile.dart';
import '../bodies/routes.dart';
import '../controller/map_controller.dart';
import '../widgets/drawer_list.dart';
import '../widgets/my_header_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  // ignore: non_constant_identifier_names

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const Maps();
      case 1:
        return const ProfilePage();
      case 2:
        return const Announcement();
      case 3:
        return const Routes();
      default:
        return const Maps();
    }
  }

  // Widget FAB(int currentIndex) {
  //   switch (currentIndex) {
  //     case 0:
  //       return SpeedDialFAB();
  //     default:
  //       return const SizedBox(
  //         height: 0,
  //         width: 0,
  //       );
  //   }
  // }
  final controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const MyHeaderDrawer(),
                const SizedBox(height: 7.5),
                // ignore: prefer_const_constructors
                DrawerList(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 158, 239, 255),
          actions: [
            IconButton(
                onPressed: () {
                  controller.buttonsVisibility.value == true
                      ? controller.buttonsVisibility.value = false
                      : controller.buttonsVisibility.value = true;
                },
                icon: const Icon(Icons.arrow_drop_down))
          ],
          title: Row(
            children: const [
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 20,
              ),
              Text(
                "Locate It",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10000000000000000000000,
          // fixedColor: ThemeData.dark().bottomAppBarColor,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey[700],
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
            size: 27,
          ),
          unselectedItemColor: Colors.grey,
          // unselectedLabelStyle: const TextStyle(
          //   color: Colors.grey,
          //   // fontFamily: 'NewFont',
          //   fontSize: 15,
          // ),
          // selectedLabelStyle: const TextStyle(
          //   color: Colors.blue,
          //   // fontFamily: 'NewFont',
          //   fontSize: 17,
          // ),
          enableFeedback: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
              tooltip: 'Map',
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              tooltip: 'See your profile',
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: 'Notification',
              tooltip: 'Notification alerts',
              icon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              label: 'Routes',
              tooltip: 'Available bus routes',
              icon: Icon(Icons.route_outlined),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        // floatingActionButton: FAB(_currentIndex),
        body: callPage(_currentIndex));
  }
}
