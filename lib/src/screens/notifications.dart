import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => NotificationState();
}

class NotificationState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/25858975',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text('Lorem ipsum dolor sit amet and consectetur',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          Text('Wednesday, December 28, 2022 at 7:45 PM',
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    )
                  ]),
            ),
            const Divider(
              height: 1,
            ),
          ],
        ),
      ],
    );
  }
}
