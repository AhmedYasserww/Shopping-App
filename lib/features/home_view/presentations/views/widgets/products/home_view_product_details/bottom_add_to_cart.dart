import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/utils/functions/failure_alert_dialog_function.dart';
import '../../../../../../../core/utils/functions/success_alert_dialog_fuction.dart';
import '../../../../../../../core/utils/styles.dart';
import '../../../../../../cart_view/data/models/cart_item_model.dart';
import '../../../../../../cart_view/presentations/manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';

class BottomAddToCart extends StatelessWidget {
  final CartItemModel cartItemModel; // CartItemModel parameter added
  const BottomAddToCart({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              final cubit = BlocProvider.of<AddProductToCartCubit>(context);
              cubit.addToCart(cartItemModel).then((_) {
                final state = cubit.state;

                if (state is AddProductToCartSuccess) {
                  showSuccessDialog(context);
                } else if (state is AddProductToCartFailure) {
                  showErrorDialog(context, state.errorMessage);
                }
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  "+ Add To Cart",
                  style: Styles.textStyle20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
