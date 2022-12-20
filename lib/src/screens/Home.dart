import 'package:flutter/material.dart';
import 'package:ezb/src/widgets/home/carousel.dart';

import 'package:ezb/src/widgets/core/app-bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: Text(
          'EZB',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ImageSliderDemo(),
      ),
    );
  }
}
