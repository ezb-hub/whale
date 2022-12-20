import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const SafeArea(
        child: Text('Sign In'),
      ),
    );
  }
}
