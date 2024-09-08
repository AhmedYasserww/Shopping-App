import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFEEEEEE),
      ),
      child: Text(
          'number of item',
          style: GoogleFonts.gabarito(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

    );
  }
}
