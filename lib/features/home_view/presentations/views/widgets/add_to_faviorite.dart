import 'package:flutter/material.dart';
class AddToFavoriteWidget extends StatelessWidget {
  const AddToFavoriteWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xffecf0ec),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {

        },
        icon: Icon(
          Icons.favorite_border ,
          color: Colors.red,
          //Icons.favorite_border,
          //color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
