import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String initials;

  const ProfileHeader({
    super.key,
    required this.userName,
    required this.initials,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(140),
              bottomRight: Radius.circular(140),
            ),
            child: Container(
              alignment: Alignment.topCenter,

              color: Colors.blue,
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          left: MediaQuery.of(context).size.width / 2 - 53,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
