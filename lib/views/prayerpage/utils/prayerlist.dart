import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prayerful/views/prayerpage/utils/prayercards.dart';

class PrayerList extends StatelessWidget {
  final String uid;

  const PrayerList({Key? key, required this.uid}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(uid).snapshots(),
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data!.docs[index];
                  final name = (docData['Name'] as String);
                  final request = (docData['Prayer'] as String);
                  final date = (docData['Date'] as Timestamp);
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
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
