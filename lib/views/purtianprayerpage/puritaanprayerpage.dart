import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PuritanPrayerPage extends StatefulWidget {
  const PuritanPrayerPage({Key? key}) : super(key: key);

  @override
  _PuritanPrayerPageState createState() => _PuritanPrayerPageState();
}

class _PuritanPrayerPageState extends State<PuritanPrayerPage> {
  firebase_storage.FirebaseStorage storage = firebase_storage;
  const ref = this.storage.ref('array.txt');

  @override
  Widget build(BuildContext context) {
    return Text(utf8.decode(getPrayer()));
  }
}
