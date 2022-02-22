import 'package:flutter/material.dart';
import 'package:prayerful/utils/date_converter.dart';

import 'package:prayerful/views/addrequestpage/addrequestpage.dart';
import 'package:prayerful/utils/page_transition.dart';
import 'package:prayerful/views/prayerpage/utils/categories.dart';
import 'package:prayerful/views/prayerpage/utils/prayerlist.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  State<PrayerPage> createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
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
      body: Column(
        children: const <Widget>[
          Categories(),
          PrayerList(),
        ],
      ),
    );
  }
}
