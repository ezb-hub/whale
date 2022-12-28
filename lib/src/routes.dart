import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:ezb/src/screens/home.dart';

import 'package:ezb/src/screens/entry/sign-in.dart';
import 'package:ezb/src/screens/entry/sign-up.dart';
import 'package:ezb/src/screens/entry/forgot-password.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'http://192.168.150.104:1337/graphql',
    );

    ValueNotifier<GraphQLClient> client =
        ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httpLink));

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: 'EZB',
          theme: ThemeData(
            fontFamily: 'Roboto',
            primaryColor: const Color(0xFF47b3e2),
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/sign-in': (context) => const SignInScreen(),
            '/sign-up': (context) => const SignUpScreen(),
            '/forgot-password': (context) => const ForgotPasswordScreen(),
          },
        ));
  }
}
