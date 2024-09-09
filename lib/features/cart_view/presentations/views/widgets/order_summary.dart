import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductToCartCubit, AddProductToCartState>(
      builder: (context, state) {
        double totalPrice = 0.0;
        if (state is AddProductToCartSuccess) {
          totalPrice = context.read<AddProductToCartCubit>().getCartTotal();
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Color(0xFFEEEEEE),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Order Total',
                    style: GoogleFonts.gabarito(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Free Shipping',
                    style: GoogleFonts.gabarito(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                '${totalPrice.toStringAsFixed(2)}\$',
                style: GoogleFonts.gabarito(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
