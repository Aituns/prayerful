import 'package:flutter/material.dart';
import 'package:prayerful/utils/page_transition.dart';

class HomepageOption extends StatelessWidget {
  final String option;
  final Widget page;

  const HomepageOption({Key? key, required this.option, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF4F4949),
          width: 6,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              alignment: Alignment.center,
              type: PageTransitionType.rightToLeftWithFade,
              child: page,
            ),
          );
        },
        child: Center(
          child: Text(
            option,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4949),
            ),
          ),
        ),
      ),
    );
  }
}
