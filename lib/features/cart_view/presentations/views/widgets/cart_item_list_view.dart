import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/core/utils/widgets/custom_error_widget.dart';
import 'package:shoping_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:shoping_app/features/cart_view/presentations/views/widgets/cart_item.dart';

import '../../../../../core/utils/widgets/custom_empty_screen.dart';
import '../../manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
class CartItemListView extends StatelessWidget {
  const CartItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<AddProductToCartCubit>().fetchCartProducts();

    return BlocBuilder<AddProductToCartCubit,AddProductToCartState>(
      builder: (context,state){
        if(state is AddProductToCartLoading){
          return const CustomLoadingIndicator();
        }
        else if(state is AddProductToCartFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else if(state is AddProductToCartSuccess){
          final cartProducts = state.cartProduct;
          if(cartProducts.isEmpty){
            return const CustomEmptyScreen();
          }
          return ListView.builder(
            itemCount: state.cartProduct.length,
            itemBuilder: (context, index) {
              return CartItem(

                cartItemModel: state.cartProduct[index],
              );
            },
          );

        }
        else{
         return  const CustomEmptyScreen();
        }
      },

    );
  }
}

