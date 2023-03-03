// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  CollectionReference message =
      FirebaseFirestore.instance.collection('notification');
  // Future<void> sendNotification(String alert, String download) async {
  //   message
  //       .add({
  //         'message': alert,
  //         'link': download,
  //         'createdOn': FieldValue.serverTimestamp(),
  //       })
  //       .then((value) => Fluttertoast.showToast(msg: 'Notification Sent'))
  //       .catchError((e) => Fluttertoast.showToast(msg: e.toString()));
  // }

  PlatformFile? pickedFile;

  // Future selectFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );
  //   if (result == null) {
  //     return;
  //   }
  //   setState(() {
  //     pickedFile = result.files.first;
  //     _controller.text = pickedFile!.name;
  //   });
  // }

  Future openFile({required String url, String? fileName}) async {
    var name = fileName ?? url.split('/').last;
    var file = await downloadFile(url, name);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    var appStorage = await getApplicationDocumentsDirectory();
    var file = File('${appStorage.path}/$name');
    try {
      var response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );

      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  var r;

  // final TextEditingController _controller = TextEditingController();
  final notificationKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 232, 232, 232),
      child: RawScrollbar(
        controller: _scrollController,
        radius: const Radius.circular(25.0),
        thickness: 7,
        thumbColor: const Color.fromARGB(255, 177, 177, 177),
        // thumbVisibility: true,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("notification")
              .orderBy('createdOn', descending: true)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Card(
                        // color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        elevation: 10,
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 10, right: 15, bottom: 3),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 9, right: 8, top: 15, bottom: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Admin:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '''${snapshot.data!.docs[index]['message']}''',
                                style: const TextStyle(fontSize: 16),
                              ),
                              snapshot.data!.docs[index]['link'] == ''
                                  ? const SizedBox()
                                  : TextButton(
                                      onPressed: (() {
                                        openFile(
                                            url: snapshot.data!.docs[index]
                                                ['link'],
                                            fileName: snapshot.data!.docs[index]
                                                ['message']);
                                      }),
                                      child: const Text("Tap to download")),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  snapshot.data!.docs[index]['createdOn'] ==
                                          null
                                      ? Text(
                                          '''${DateTime.now().day}/${DateTime.now().month}   ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString().padLeft(2, '0')}''',
                                          // style: const TextStyle(fontSize: ),
                                        )
                                      : Text(
                                          '''${snapshot.data!.docs[index]['createdOn'].toDate().day}/${snapshot.data!.docs[index]['createdOn'].toDate().month}   ${snapshot.data!.docs[index]['createdOn'].toDate().hour.toString()}:${snapshot.data!.docs[index]['createdOn'].toDate().minute.toString().padLeft(2, '0')}''',
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
