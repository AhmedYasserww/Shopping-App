import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final double width;

  const CheckoutButton({required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: null, // Add your onPressed function here
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all<Size>(
            const Size(double.infinity, 60),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Color(0xFF00AA5A)),
            ),
          ),
          backgroundColor:
              WidgetStateProperty.all<Color>(const Color(0xFF00AA5A)),
        ),
        child: const Text(
          'Checkout',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
