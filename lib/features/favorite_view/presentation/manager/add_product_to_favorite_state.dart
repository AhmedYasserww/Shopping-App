part of 'add_product_to_favorite_cubit.dart';

@immutable

abstract class AddProductToFavoriteState {}

class AddProductToFavoriteInitial extends AddProductToFavoriteState {}

class AddProductToFavoriteLoading extends AddProductToFavoriteState {}

class AddProductToFavoriteSuccess extends AddProductToFavoriteState {
  final List<ProductFavoriteModel> favoriteProducts;

  AddProductToFavoriteSuccess({required this.favoriteProducts});
}

class AddProductToFavoriteFailure extends AddProductToFavoriteState {
  final String errorMessage;

  AddProductToFavoriteFailure({required this.errorMessage});
}