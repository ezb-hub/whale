import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ezb/src/widgets/core/item-list.dart';

class CategoriesWithProduct extends StatefulWidget {
  const CategoriesWithProduct({super.key});

  @override
  State<CategoriesWithProduct> createState() => CategoriesWithProductState();
}

class CategoriesWithProductState extends State<CategoriesWithProduct> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    String getCategoriesWithProduct = """
      query GET_CATEGORIES_WITH_PRODUCT {
        categories(
          sort: "createdAt:asc",
          pagination: {
            limit: 4
          },
          filters: {
            products: {
              id: {
                notNull: true
              }
            }
          },
        ) {
          data {
            id,
            attributes {
              title,
              products(sort: "createdAt:asc", pagination: { limit: 4 }) {
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
        document: gql(getCategoriesWithProduct),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? categories = result.data?['categories']?['data'];

        if (categories != null) {
          return Column(
            children: categories.map((item) {
              return Column(
                children: <Widget>[
                  ItemListWidget(
                      data: item['attributes']['products']['data'],
                      title: item['attributes']['title']),
                  const SizedBox(height: 32),
                ],
              );
            }).toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
