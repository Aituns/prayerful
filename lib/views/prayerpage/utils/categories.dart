import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:prayerful/utils/globals.dart' as globals;

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: StreamBuilder(
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
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final docData = snapshot.data!.docs[index];
                    final tags = (docData['tags'] as List<dynamic>);
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {}, //TODO CHANGE
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFF4F4949),
                                width: 3,
                              ),
                            ),
                            child: Text(
                              ' ' + tags[i] + ' ',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                )
              : const Center(child: Text('asdf'));
        },
      ),
    );
  }
}
