import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/features/favorite_view/data/models/product_faviorite_model.dart';

part 'add_product_to_favorite_state.dart';

class AddProductToFavoriteCubit extends Cubit<AddProductToFavoriteState> {
  AddProductToFavoriteCubit() : super(AddProductToFavoriteInitial());

  Future<void> toggleFavorite(ProductFavoriteModel favoriteProduct) async {
    emit(AddProductToFavoriteLoading());
    try {
      var favoriteBox = Hive.box<ProductFavoriteModel>(kFavoriteBox);
      bool productExists = favoriteBox.values.any((product) => product.productId == favoriteProduct.productId);

      if (productExists) {
        await removeFromFavorites(favoriteProduct);
        emit(AddProductToFavoriteSuccess(
          favoriteProducts: favoriteBox.values.toList(),
        ));
      } else {
        await addToFavorites(favoriteProduct);
        emit(AddProductToFavoriteSuccess(
          favoriteProducts: favoriteBox.values.toList(),
        ));
      }
    } on Exception catch (e) {
      emit(AddProductToFavoriteFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addToFavorites(ProductFavoriteModel favoriteProduct) async {
    final favoriteBox = Hive.box<ProductFavoriteModel>(kFavoriteBox);
    await favoriteBox.add(favoriteProduct);
  }

  Future<void> removeFromFavorites(ProductFavoriteModel favoriteProduct) async {
    final favoriteBox = Hive.box<ProductFavoriteModel>(kFavoriteBox);
    final keyToRemove = favoriteBox.values
        .firstWhere((product) => product.productId == favoriteProduct.productId)
        .key;
    await favoriteBox.delete(keyToRemove);
  }

  Future<void> fetchFavoriteProducts() async {
    emit(AddProductToFavoriteLoading());
    try {
      final favoriteBox = Hive.box<ProductFavoriteModel>(kFavoriteBox);
      final favoriteProducts = favoriteBox.values.toList();
      emit(AddProductToFavoriteSuccess(
        favoriteProducts: favoriteProducts,
      ));
    } on Exception catch (e) {
      emit(AddProductToFavoriteFailure(errorMessage: e.toString()));
    }
  }
}


