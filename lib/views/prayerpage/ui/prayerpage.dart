//import 'package:firebase_database/firebase_database.dart';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prayerful/utils/date_converter.dart';
import 'package:prayerful/views/addrequestpage/addrequestpage.dart';

import 'package:prayerful/utils/page_transition.dart';
import 'package:prayerful/views/prayerpage/utils/prayercards.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  final uid = FirebaseAuth.instance.currentUser!.uid.toString();
  final DateConverter dc = DateConverter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                alignment: Alignment.center,
                type: PageTransitionType.rightToLeftWithFade,
                child: const AddRequestPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: PrayerPage());
  }
}
