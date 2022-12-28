import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ezb/src/widgets/core/carousel.dart';

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
    String getHomeSlide = """
      query GET_HOME_SLIDER {
        homeSliders {
          data {
            id,
            attributes {
              title,
              sub_title,
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
        document: gql(getHomeSlide),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? sliders = result.data?['homeSliders']?['data'];

        if (sliders != null) {
          return ImageSlider(data: sliders);
        } else {
          return const Text('Empty');
        }
      },
    );
  }
}
