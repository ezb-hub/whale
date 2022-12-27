import 'package:flutter/material.dart';

import 'package:ezb/src/widgets/core/app-bar.dart';
import 'package:ezb/src/widgets/core/sidebar.dart';
import 'package:ezb/src/widgets/core/text-float-image.dart';
import 'package:ezb/src/widgets/core/item-list.dart';

import 'package:ezb/src/widgets/home/carousel.dart';
import 'package:ezb/src/widgets/home/product-carousel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        MainImageSlider(),
        SizedBox(height: 16),
        ProductSlider(),
        SizedBox(height: 12),
        TextFloatImageWidget(
          image:
              'https://cwsmgmt.corsair.com/pdp/cooling/elite-lcd/assets/images/scarif-wide-compatibility-bg.jpg',
          title: 'ELITE LCD UPGRADE KIT',
          subtitle:
              'Transforms your CORSAIR ELITE CAPELLIX CPU cooler into a personalized dashboard.',
        ),
        SizedBox(height: 32),
        ItemListWidget(),
      ],
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Second Tab');
  }
}

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Third Tab');
  }
}

class FourthTab extends StatelessWidget {
  const FourthTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Fourth Tab');
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    SecondTab(),
    ThirdTab(),
    FourthTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: const SideBarWidget(),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
