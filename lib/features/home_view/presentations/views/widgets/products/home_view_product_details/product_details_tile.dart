import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';

class ProductDetailsTile extends StatelessWidget {
  const ProductDetailsTile(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
      ),
      children: <Widget>[
        ListTile(
          title: Text(description,style: Styles.textStyle16.copyWith(color: const Color(0xFF6C6C6C))
          ),
        ),
      ],
    );
  }
}
