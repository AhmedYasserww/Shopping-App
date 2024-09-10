import 'package:flutter/material.dart';
class CustomAppBarProfile extends StatelessWidget  implements PreferredSizeWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Profile'),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
