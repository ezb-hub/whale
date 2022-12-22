import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://cwsmgmt.corsair.com/hybris/tlc/cooling/images/tlc_cpu_cooling_elitelcd.jpg',
  'https://cwsmgmt.corsair.com/hybris/tlc/cooling/images/tlc_cpu_cooling_banner_h170i_elite_cpllx.jpg',
  'https://cwsmgmt.corsair.com/hybris/homepage/images/cia/cia-pc-builder.jpg',
];

class MainImageSlider extends StatefulWidget {
  const MainImageSlider({super.key});

  @override
  State<MainImageSlider> createState() => MainImageSliderState();
}

class MainImageSliderState extends State<MainImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imgList
                  .map((item) => Container(
                        padding: EdgeInsets.zero,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(item,
                                fit: BoxFit.cover, width: 1000)),
                      ))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return Expanded(
                child: Container(
                  height: 3.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: (_current == entry.key
                          ? Theme.of(context).primaryColor
                          : Colors.grey[350])),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
