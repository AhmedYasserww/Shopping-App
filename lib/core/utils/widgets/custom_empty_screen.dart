import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No items added yet.',
        style: GoogleFonts.gabarito(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
