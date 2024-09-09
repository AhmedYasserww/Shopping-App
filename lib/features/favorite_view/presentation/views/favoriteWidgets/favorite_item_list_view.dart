import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/core/utils/widgets/custom_empty_screen.dart';
import 'package:shoping_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:shoping_app/features/favorite_view/presentation/manager/add_product_to_favorite_cubit.dart';
import 'package:shoping_app/features/favorite_view/presentation/views/favoriteWidgets/favorite_item.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddProductToFavoriteCubit>().fetchFavoriteProducts();

    return BlocBuilder<AddProductToFavoriteCubit, AddProductToFavoriteState>(
      builder: (context, state) {
        if (state is AddProductToFavoriteLoading) {
          return const CustomLoadingIndicator();
        } else if (state is AddProductToFavoriteFailure) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state is AddProductToFavoriteSuccess) {
          final favoriteProducts = state.favoriteProducts;
          if (favoriteProducts.isEmpty) {
            return const  CustomEmptyScreen(message: 'No items added yet.',);
          }
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, i) {
              return FavoriteItem(product: favoriteProducts[i]);
            },
          );
        } else {
          return const CustomEmptyScreen(message: 'No items added yet.',);
        }
      },
    );
  }
}
