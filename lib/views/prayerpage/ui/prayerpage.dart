//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('testing')
              .add({'timestamp': Timestamp.fromDate(DateTime.now())});
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('testing').snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          //if //(!snapshot.hasData) return const SizedBox.shrink();
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final docData = snapshot.data!.docs[index];
                    final dateTime =
                        (docData['timestamp'] as Timestamp).toDate();
                    return ListTile(
                      title: Text(dateTime.toString()),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
