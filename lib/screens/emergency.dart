import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class EmergencyNumber extends StatefulWidget {
  const EmergencyNumber({super.key});

  @override
  State<EmergencyNumber> createState() => _EmergencyNumberState();
}

class _EmergencyNumberState extends State<EmergencyNumber> {
  CollectionReference emergencynumber =
      FirebaseFirestore.instance.collection('emergency_number');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 244, 244),
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 158, 239, 255),
      ),
      body: RawScrollbar(
          child: Container(
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
        child: StreamBuilder(
          stream: emergencynumber.snapshots(),
          builder: ((context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "${snapshot.data!.docs[index]['name']}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Phone no : ${snapshot.data!.docs[index]['number']}",
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              await FlutterPhoneDirectCaller
                                                  .callNumber(
                                                      "${snapshot.data!.docs[index]['number']}");
                                            },
                                            icon: const Icon(
                                              Icons.call,
                                              size: 17,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )));
          }),
        ),
      )),
    );
  }
}
