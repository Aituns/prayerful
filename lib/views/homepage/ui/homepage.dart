import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:prayerful/views/homepage/utils/homepage_option.dart';
import 'package:prayerful/views/optionspage/optionspage.dart';
import 'package:prayerful/views/prayerpage/ui/prayerpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double blocksSizeHorizontal = screenWidth / 100;
    double height = blocksSizeHorizontal * 40;
    double width = blocksSizeHorizontal * 40;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/prayerful.svg',
                  height: blocksSizeHorizontal * 65,
                  width: blocksSizeHorizontal * 65,
                  color: const Color(0xFF4F4949),
                ),
              ),
            ],
          ),
          const Text(
            'Prayerful',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4949),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HomepageOption(
                  option: 'Prayers',
                  page: const PrayerPage(),
                  height: height,
                  width: width,
                  padding: 4),
              HomepageOption(
                option: 'Biblical\nPrayers',
                page: const PrayerPage(),
                height: height,
                width: width,
                padding: 4,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HomepageOption(
                  option: 'Puritans\nPrayers',
                  page: const PrayerPage(),
                  height: height,
                  width: width,
                  padding: 4),
              HomepageOption(
                  option: 'Options',
                  page: const OptionsPage(),
                  height: height,
                  width: width,
                  padding: 4),
            ],
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
