import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/cart_header.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/cart_item.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/cart_item_list_view.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/checkout_button.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/order_summary.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Your Cart',
          style: GoogleFonts.gabarito(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CartHeader(),
            const SizedBox(height: 20),
            // List of cart items
            Expanded(
              child: CartItemListView(),
            ),

            const OrderSummary(),
            const SizedBox(height: 20),
            CheckoutButton(width: width),
          ],
        ),
      ),
    );
  }
}


