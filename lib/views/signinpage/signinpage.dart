import 'package:prayerful/utils/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;
    double blocksSizeHorizontal = screenWidth / 100;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(children: <Widget>[
            SizedBox(
              width: blocksSizeHorizontal * 45,
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                ),
              ),
            ),
            SizedBox(
              width: blocksSizeHorizontal * 45,
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                ),
              ),
            ),
          ]),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: const Text("Sign in"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
            },
            child: const Text("Sign up"),
          ),
        ],
      ),
    );
  }
}
