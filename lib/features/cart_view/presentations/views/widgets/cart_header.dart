import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/features/cart_view/presentations/manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
     int countOfProducts = BlocProvider.of<AddProductToCartCubit>(context).getCartItemCount();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFFEEEEEE),
      ),
      child: Text(
          'number of item $countOfProducts',
          style: GoogleFonts.gabarito(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

    );
  }
}
