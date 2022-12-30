import 'package:flutter/material.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({
    super.key,
    required this.data,
    required this.title,
  });

  final String title;
  final List<dynamic> data;

  @override
  State<ItemListWidget> createState() => ItemListWidgetState();
}

class ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(widget.title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GridView.count(
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              children: widget.data.map((item) {
                return Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                              color: Colors.black.withOpacity(0.05),
                              padding: const EdgeInsets.all(16),
                              child: Image.network(
                                item['attributes']['media']['data'][0]
                                    ['attributes']['formats']['small']['url'],
                                fit: BoxFit.contain,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Text(item['attributes']['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500))),
                        ),
                      ],
                    ));
              }).toList(),
            ))
      ],
    );
  }
}
