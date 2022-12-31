import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ezb/src/widgets/core/text-float-image.dart';

class HomeAds extends StatefulWidget {
  const HomeAds({super.key});

  @override
  State<HomeAds> createState() => HomeAdsState();
}

class HomeAdsState extends State<HomeAds> {
  @override
  Widget build(BuildContext context) {
    String getHomeAds = """
      query GET_AD {
        ad(id: 1) {
          data {
            id,
            attributes {
              title,
              sub_title,
              media {
                data {
                  attributes {
                    formats,
                  },
                },
              },
            },
          }
        }
      }
    """;

    return Query(
      options: QueryOptions(
        document: gql(getHomeAds),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        var ad = result.data?['ad']?['data'];

        if (ad != null) {
          return TextFloatImageWidget(
            image: ad?['attributes']?['media']?['data']?['attributes']
                ?['formats']?['large']?['url'],
            title: ad?['attributes']?['title'],
            subtitle: ad?['attributes']?['sub_title'],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
