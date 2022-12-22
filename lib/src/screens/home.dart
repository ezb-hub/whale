import 'package:flutter/material.dart';

import 'package:ezb/src/widgets/core/app-bar.dart';
import 'package:ezb/src/widgets/core/sidebar.dart';

import 'package:ezb/src/widgets/home/carousel.dart';
import 'package:ezb/src/widgets/home/product-carousel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: Text(
          'EZB',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const <Widget>[
            MainImageSlider(),
            SizedBox(height: 16),
            ProductSlider(),
          ],
        ),
      ),
      drawer: const SideBarWidget(),
    );
  }
}
