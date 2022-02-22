import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayerful/views/prayerpage/utils/prayercards.dart';

import 'package:prayerful/utils/globals.dart' as globals;

class PrayerList extends StatelessWidget {
  const PrayerList({Key? key, s}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(globals.uid)
          //.where('tags'[0], arrayContains: 'test')
          .orderBy('date', descending: true)
          .snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data!.docs[index];
                  final name = (docData['name'] as String);
                  final request = (docData['prayer'] as String);
                  final date = (docData['date'] as Timestamp);
                  return Dismissible(
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        {
                          FirebaseFirestore.instance.runTransaction(
                              (Transaction myTransaction) async {
                            myTransaction.delete((docData.reference));
                          });
                        }
                      },
                      background: Container(color: Colors.red),
                      child: PrayerCard(
                        date: date,
                        name: name,
                        request: request,
                      ));
                },
              )
            : const Center(child: Text('Empty'));
      },
    );
  }
}
