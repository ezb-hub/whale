import 'package:flutter/material.dart';

class TextFloatImageWidget extends StatefulWidget {
  const TextFloatImageWidget({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  State<TextFloatImageWidget> createState() => TextFloatImageWidgetState();
}

class TextFloatImageWidgetState extends State<TextFloatImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: [
                Image.network(
                  widget.image,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )),
                          const SizedBox(height: 8),
                          Text(widget.subtitle,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.3,
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
