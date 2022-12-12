import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  Size screenSize() => MediaQuery.of(context).size;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: screenSize().width * 0.03),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("routes").snapshots(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.docs.length == 0) {
                return const Center(
                    child: Text(
                  'Currently no routes are available.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ));
              } else {
                return ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            color: const Color.fromARGB(255, 210, 242, 249),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black54)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              width: screenSize().width * 0.9,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                right: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06),
                                            child: ExpansionTile(
                                              backgroundColor:
                                                  Colors.transparent,
                                              collapsedBackgroundColor:
                                                  Colors.transparent,
                                              expandedAlignment:
                                                  Alignment.topLeft,
                                              title: Text(
                                                "${snapshot.data.docs[index]['startingPoint']} - ${snapshot.data.docs[index]['endingPoint']}",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "• ${snapshot.data!.docs[index]['startingPoint']}",
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: List.from(
                                                            snapshot
                                                                .data!
                                                                .docs[index][
                                                                    'intermediatePoint']
                                                                .map(
                                                                    (points) =>
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(bottom: 6),
                                                                          child:
                                                                              Text(
                                                                            "• $points",
                                                                            style:
                                                                                const TextStyle(fontSize: 16),
                                                                          ),
                                                                        ))),
                                                      ),
                                                      Text(
                                                        "• ${snapshot.data!.docs[index]['endingPoint']}",
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      )
                                                    ]),
                                              ],
                                            ),
                                          )
                                        ])),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    });
              }
            })));
  }
}
