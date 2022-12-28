import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:ezb/src/icons/map.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String getCoreNavigations = """
      query GET_CORE_NAVIGATIONS {
        coreNavigations {
          data {
            id,
            attributes {
              title,
              order,
              slug,
              icon,
            },
          }
        }
      }
    """;

    return Query(
      options: QueryOptions(
        document: gql(getCoreNavigations),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? navigations = result.data?['coreNavigations']?['data'];

        List<Widget>? navWidget = navigations?.map((nav) {
          return ListTile(
            leading: Icon(iconMapping[nav['attributes']['icon']]),
            title: Text(nav['attributes']['title']),
            onTap: () {},
          );
        }).toList();

        return Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
              // UserAccountsDrawerHeader(
              //   accountName: Text('Oflutter.com'),
              //   accountEmail: Text('example@gmail.com'),
              //   currentAccountPicture: CircleAvatar(
              //     child: ClipOval(
              //       child: Image.network(
              //         'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
              //         fit: BoxFit.cover,
              //         width: 90,
              //         height: 90,
              //       ),
              //     ),
              //   ),
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('assets/images/drawer-header.jpg')),
              //   ),
              // ),
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/drawer-header.jpg')),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      Icons.account_circle,
                      size: 85,
                      color: Colors.white,
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-in');
                          },
                          child: const Text('Sign In',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          width: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/sign-up');
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ...?navWidget,
              const Divider(
                height: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
