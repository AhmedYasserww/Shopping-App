part of 'add_product_to_cart_cubit.dart';

@immutable
abstract class AddProductToCartState {}

class AddProductToCartInitial extends AddProductToCartState {}

class AddProductToCartLoading extends AddProductToCartState {}

class AddProductToCartSuccess extends AddProductToCartState {
  final List<CartItemModel> cartProduct;

  AddProductToCartSuccess({required this.cartProduct});
}

class AddProductToCartFailure extends AddProductToCartState {
  final String errorMessage;

  AddProductToCartFailure({required this.errorMessage});
}