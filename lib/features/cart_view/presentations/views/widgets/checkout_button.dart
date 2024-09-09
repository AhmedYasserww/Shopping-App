import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CheckoutButton extends StatelessWidget {
  final double width;

  const CheckoutButton({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: double.infinity,
        height: 60,
        child:  Text(
          'Checkout',
          style: Styles.textStyle20.copyWith(color: Colors.white,fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
