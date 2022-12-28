import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({
    super.key,
    required this.title,
    required this.data,
  });

  final String title;
  final List<dynamic> data;

  @override
  State<ProductSlider> createState() => ProductSliderState();
}

class ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    int imageCount = (widget.data.length / 2).round();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: <Widget>[
            Text(widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            CarouselSlider.builder(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 15),
              ),
              itemCount: imageCount,
              itemBuilder: (context, index, _) {
                final int first = index * 2;
                final int? second =
                    index * 2 < widget.data.length - 1 ? first + 1 : null;
                return Row(
                  children: [first, second].map((idx) {
                    return Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: idx != null
                            ? Card(
                                elevation: 1.5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      color: Colors.black.withOpacity(0.05),
                                      child: Image.network(
                                        widget.data[idx]?['attributes']
                                                    ?['media']?['data']
                                                ?['attributes']?['formats']
                                            ?['thumbnail']?['url'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                          widget.data[idx]?['attributes']
                                              ?['title'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ))
                            : const SizedBox.shrink(),
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
