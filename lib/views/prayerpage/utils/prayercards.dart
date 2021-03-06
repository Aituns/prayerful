import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:prayerful/utils/globals.dart' as globals;

class PrayerCard extends StatelessWidget {
  final String name;
  final String request;
  final Timestamp date;

  const PrayerCard({
    Key? key,
    required this.date,
    required this.name,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF4F4949),
            width: 5,
          ),
        ),
        child: ListTile(
          title: Text(
            name.toString() + ": " + globals.dc.toMDY(date.toDate()),
            style: const TextStyle(
                fontFamily: 'SF-Pro-Display',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            request.toString(),
            style: const TextStyle(
              fontFamily: 'SF-Pro-Display',
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
