import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo_impl.dart';

part 'fetch_specific_product_state.dart';

class FetchSpecificProductCubit extends Cubit<FetchSpecificProductState> {
  FetchSpecificProductCubit(this.homeRepoImpl,this.category) : super(FetchSpecificProductInitial());
  final HomeRepoImpl homeRepoImpl;
  final String category;

  Future<void> fetchSpecificProduct() async {
    emit(FetchSpecificProductLoading());
    try {
      var data = await homeRepoImpl.fetchSpecificProduct(category: category);
      data.fold(
            (failure) {
          // Handle the failure case, maybe emit an empty list or show an error
          print('Error: ${failure.errorMessage}');
          emit(FetchSpecificProductFailure(errorMessage: failure.errorMessage));
        },
            (product) {

          print('product fetched successfully: $product');
          emit(FetchSpecificProductSuccess(product: product));
        },
      );
    } on Exception catch (e) {
      print(e.toString());
    emit(FetchSpecificProductFailure(errorMessage: e.toString()));
    }
  }
}
