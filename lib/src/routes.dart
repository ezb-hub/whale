import 'package:flutter/material.dart';

import 'package:ezb/src/screens/home.dart';
import 'package:ezb/src/screens/auth/sign-in.dart';
import 'package:ezb/src/screens/auth/sign-up.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZB',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF47b3e2),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
      },
    );
  }
}
