import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({required this.title, super.key});

  final Widget title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () => print('asdf'),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () => print('test'),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
