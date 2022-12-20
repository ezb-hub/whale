import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          ListTile(
            leading: const Icon(Icons.keyboard),
            title: const Text('Gaming Gear'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.headset_mic),
            title: const Text('Streaming Gear'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.developer_board),
            title: const Text('PC Components'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.sports_esports),
            title: const Text('Gaming PCs'),
            onTap: () {},
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
