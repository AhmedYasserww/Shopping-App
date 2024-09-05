import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo_impl.dart';

import '../../../data/models/ProductModel.dart';

part 'fetch_top_products_state.dart';

class FetchTopProductsCubit extends Cubit<FetchTopProductsState> {
  FetchTopProductsCubit(this.homeRepoImpl) : super(FetchTopProductsInitial());
  final HomeRepoImpl homeRepoImpl;


  Future<void> fetchTopProducts() async {
    emit(FetchTopProductLoading());
    try {
      var data = await homeRepoImpl.fetchTopProduct();
      data.fold(
            (failure) {
          print('Error: ${failure.errorMessage}');
          emit(FetchTopProductFailure(errorMessage: failure.errorMessage));
        },
            (product) {

          print('product fetched successfully: $product');
          emit(FetchTopProductSuccess(product: product));
        },
      );
    } on Exception catch (e) {
      print(e.toString());
      emit(FetchTopProductFailure(errorMessage: e.toString()));
    }
  }
}


