import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:ezb/src/widgets/core/product-carousel.dart';

class ItemSlider extends StatefulWidget {
  const ItemSlider({super.key});

  @override
  State<ItemSlider> createState() => ItemSliderState();
}

class ItemSliderState extends State<ItemSlider> {
  @override
  Widget build(BuildContext context) {
    String getCategories = """
      query GET_CATEGORIES {
        categories {
          data {
            id,
            attributes {
              title,
              media {
                data {
                  attributes {
                    formats
                  }
                }
              },
            },
          }
        }
      }
    """;

    return Query(
      options: QueryOptions(
        document: gql(getCategories),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? products = result.data?['categories']?['data'];

        return ProductSlider(title: 'Explore Product', data: products);
      },
    );
  }
}
