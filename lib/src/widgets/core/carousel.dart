import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.data,
  });

  final List<dynamic> data;

  @override
  State<ImageSlider> createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
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
              items: widget.data
                  .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Stack(
                        children: <Widget>[
                          Image.network(
                            item?['attributes']?['media']?['data']
                                ?['attributes']?['formats']?['large']?['url'],
                            fit: BoxFit.cover,
                            height: 250,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(item?['attributes']?['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  const SizedBox(height: 8),
                                  Text(item?['attributes']?['sub_title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        height: 1.3,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )))
                  .toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.data.asMap().entries.map((entry) {
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
