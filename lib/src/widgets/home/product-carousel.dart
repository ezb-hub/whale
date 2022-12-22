import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Product {
  String image = '';
  String title = '';

  Product({
    required this.image,
    required this.title,
  });
}

final List<Product> imgList = [
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-cases.png',
      title: 'Cases'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-keyboards.png',
      title: 'Keyboard'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-headsets.png',
      title: 'Headsets'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-laptops.png',
      title: 'Gaming Laptops'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/content/images/header/explore-monitors.png',
      title: 'Monitors'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-gaming-pcs.png',
      title: 'Gaming PCs'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-cameras.png',
      title: 'Cameras'),
  Product(
      image: 'https://cwsmgmt.corsair.com/landing/home/images/explore-mice.png',
      title: 'Mice'),
  Product(
      image: 'https://cwsmgmt.corsair.com/landing/home/images/explore-psu.png',
      title: 'Power Supplies'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-cpu-coolers.png',
      title: 'CPU Coolers'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-custom-cooling.png',
      title: 'Custom Cooling'),
  Product(
      image: 'https://cwsmgmt.corsair.com/landing/home/images/explore-fans.png',
      title: 'Fans'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-gaming-chairs.png',
      title: 'Gaming Chairs'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-memory.png',
      title: 'Memory'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-storage.png',
      title: 'Storage'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-mousepads.png',
      title: 'Mouse Pads'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-ambient-lighting.png',
      title: 'Ambient Lighting'),
  Product(
      image:
          'https://cwsmgmt.corsair.com/landing/home/images/explore-thunderbolt-docks.png',
      title: 'Thunderbolt Docks'),
];

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => ProductSliderState();
}

class ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    int imageCount = (imgList.length / 2).round();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            const Text('Explore Product',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            CarouselSlider.builder(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
              ),
              itemCount: imageCount,
              itemBuilder: (context, index, _) {
                final int first = index * 2;
                final int? second =
                    index * 2 < imgList.length - 1 ? first + 1 : null;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [first, second].map((idx) {
                    return Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: idx != null
                              ? Container(
                                  color: Colors.white,
                                  child: Image.network(
                                    imgList[idx].image,
                                    fit: BoxFit.cover,
                                  ))
                              : const SizedBox.shrink(),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ));
  }
}
