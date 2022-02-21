import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:prayerful/theme/dark.dart';
import 'package:prayerful/theme/light.dart';
import 'package:prayerful/utils/authentication_service.dart';
import 'package:prayerful/views/homepage/ui/homepage.dart';
import 'package:prayerful/views/signinpage/signinpage.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  //Transparent Status Bar
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await Firebase.initializeApp();
  runApp(const Prayerful());
}

class Prayerful extends StatelessWidget {
  const Prayerful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        Provider<AuthenticationService?>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: ((context) =>
              context.read<AuthenticationService>().authStateChanges),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Light().themeData,
        darkTheme: Dark().themeData,
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const HomePage();
    }
    return SignInPage();
  }
}
