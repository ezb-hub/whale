import 'package:flutter/material.dart';
import 'package:ezb/src/components/Carousel.dart';

import 'package:ezb/src/AppBar.dart';

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
