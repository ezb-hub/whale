import 'package:flutter/material.dart';

import 'package:ezb/src/widgets/core/app-bar.dart';
import 'package:ezb/src/widgets/core/sidebar.dart';
import 'package:ezb/src/widgets/core/text-float-image.dart';

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
        child: ListView(
          children: const <Widget>[
            MainImageSlider(),
            SizedBox(height: 16),
            ProductSlider(),
            SizedBox(height: 16),
            TextFloatImageWidget(
              image:
                  'https://cwsmgmt.corsair.com/pdp/cooling/elite-lcd/assets/images/scarif-wide-compatibility-bg.jpg',
              title: 'ELITE LCD UPGRADE KIT',
              subtitle:
                  'Transforms your CORSAIR ELITE CAPELLIX CPU cooler into a personalized dashboard.',
            ),
          ],
        ),
      ),
      drawer: const SideBarWidget(),
    );
  }
}
