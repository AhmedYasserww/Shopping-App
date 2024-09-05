part of 'fetch_specific_product_cubit.dart';

@immutable
abstract class FetchSpecificProductState {}

class FetchSpecificProductInitial extends FetchSpecificProductState {}
class FetchSpecificProductLoading extends FetchSpecificProductState {}
class FetchSpecificProductSuccess extends FetchSpecificProductState {
  final List<ProductModel>product;

  FetchSpecificProductSuccess({required this.product});
}
class FetchSpecificProductFailure extends FetchSpecificProductState {
  final String errorMessage ;

  FetchSpecificProductFailure({required this.errorMessage});
}

