part of 'fetch_top_products_cubit.dart';

@immutable
abstract class FetchTopProductsState {}

class FetchTopProductsInitial extends FetchTopProductsState {}
class FetchTopProductLoading extends FetchTopProductsState {}
class FetchTopProductSuccess extends FetchTopProductsState {
  final List<ProductModel>product;

  FetchTopProductSuccess({required this.product});
}
class FetchTopProductFailure extends FetchTopProductsState {
  final String errorMessage ;

  FetchTopProductFailure({required this.errorMessage});
}

