import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/features/favorite_view/data/models/product_faviorite_model.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../favorite_view/presentation/manager/add_product_to_favorite_cubit.dart';

class AddToFavoriteWidget extends StatelessWidget {
  const AddToFavoriteWidget({super.key, required this.favoriteModel});
  final ProductFavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductToFavoriteCubit, AddProductToFavoriteState>(
      listener: (context, state) {
        if (state is AddProductToFavoriteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        final isSelected = state is AddProductToFavoriteSuccess
            ? state.favoriteProducts.any((product) => product.productId == favoriteModel.productId)
            : false;

        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffecf0ec),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              final cubit = getIt<AddProductToFavoriteCubit>();
              cubit.toggleFavorite(favoriteModel);
            },
            icon: isSelected
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border, color: Colors.red),
          ),
        );
      },
    );
  }
}
