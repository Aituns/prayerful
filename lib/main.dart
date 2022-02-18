import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prayerful/theme/dark.dart';
import 'package:prayerful/theme/light.dart';

import 'package:prayerful/views/homepage/ui/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Transparent Status Bar
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Prayerful());
}

class Prayerful extends StatelessWidget {
  const Prayerful({Key? key}) : super(key: key);
  //final Future<FirebaseApp> _fpApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Light().themeData,
      darkTheme: Dark().themeData,
      home: const HomePage(),
      //FutureBuilder(
      // future: _fpApp,
      // builder: (context, snapshot) {
      //   if (snapshot.hasError) {
      //     print('You have an error! ${snapshot.error.toString()}}');
      //     return const Text('Something went wrong!');
      //   } else if (snapshot.hasData) {
      //     return const HomePage();
      //   } else {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      // },
    );
  }
}
