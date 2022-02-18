import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prayerful/views/addrequestpage/addrequestpage.dart';

import 'package:prayerful/views/homepage/utils/homepage_option.dart';
import 'package:prayerful/views/prayerpage/ui/prayerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/prayerful.svg',
              height: 250,
              width: 250,
              color: const Color(0xFF4F4949),
            ),
          ),
          const Text(
            'Prayerful',
            style: TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4949),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(35),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: const <Widget>[
              HomepageOption(
                option: 'Your \nPrayers',
                page: PrayerPage(),
              ),
              HomepageOption(
                option: 'Biblical \nPrayers',
                page: AddRequestPage(),
              ),
              HomepageOption(
                option: 'Puritan \nPrayers',
                page: PrayerPage(),
              ),
              HomepageOption(
                option: 'Options',
                page: PrayerPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
