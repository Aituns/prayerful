import 'package:flutter/material.dart';
import 'package:prayerful/utils/authentication_service.dart';
import 'package:provider/provider.dart';

class OptionsPage extends StatelessWidget {
  OptionsPage({Key? key}) : super(key: key);

  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              Navigator.pop(context);
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.redAccent,
                fontFamily: 'SF-Pro-Display',
                fontSize: 18,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
