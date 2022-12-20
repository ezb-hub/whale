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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/sign-in': (context) => const SignInScreen(),
        '/sign-up': (context) => const SignUpScreen(),
      },
    );
  }
}
