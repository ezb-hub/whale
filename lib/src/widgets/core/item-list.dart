import 'package:flutter/material.dart';

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
          'https://www.corsair.com/ww/en/medias/sys_master/images/images/h4d/h5e/9659515142174/base-5000d-airflow/Gallery/5000D_AF_BLACK_001/-base-5000d-airflow-Gallery-5000D-AF-BLACK-001.png_1200Wx1200H',
      title: '5000D AIRFLOW Tempered Glass Mid-Tower ATX PC Case — Black'),
  Product(
      image:
          'https://www.corsair.com/ww/en/medias/sys_master/images/images/hac/h5d/9659502559262/base-5000x/Gallery/5000X_RGB_BLACK_001/-base-5000x-Gallery-5000X-RGB-BLACK-001.png_1200Wx1200H',
      title:
          'iCUE 5000X RGB Tempered Glass Mid-Tower ATX PC Smart Case — Black'),
  Product(
      image:
          'https://www.corsair.com/medias/sys_master/images/images/h4b/hf0/9190818742302/-CC-9011168-WW-Gallery-680X-RGB-Black-01.png',
      title:
          'Crystal Series 680X RGB ATX High Airflow Tempered Glass Smart Case — Black'),
  Product(
      image:
          'https://www.corsair.com/medias/sys_master/images/images/heb/h6a/9112465244190/-CC-9011148-WW-Gallery-1000D-01.png',
      title: 'Obsidian Series 1000D Super-Tower Case'),
];

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({super.key});

  @override
  State<ItemListWidget> createState() => ItemListWidgetState();
}

class ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('Cases',
            style: TextStyle(
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
              children: imgList.map((item) {
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
                                item.image,
                                fit: BoxFit.contain,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              child: Text(item.title,
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
