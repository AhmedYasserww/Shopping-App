import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_app/features/search_view/data/repo/search_repo_imp.dart';

import '../../../../home_view/data/models/ProductModel.dart';

part 'search_for_product_state.dart';

class SearchForProductCubit extends Cubit<SearchForProductState> {
  final SearchRepoImp searchRepoImpl;
  final String initialQuery;

  SearchForProductCubit(this.searchRepoImpl, this.initialQuery)
      : super(SearchForProductInitial());

  Future<void> searchForProduct([String query = ""]) async {
    if (query.isEmpty) {
      emit(SearchForProductInitial());
      return;
    }

    emit(SearchForProductLoading());
    try {
      var data = await searchRepoImpl.searchForProduct(product: query);
      data.fold(
            (failure) {
          emit(SearchForProductFailure(errorMessage: failure.errorMessage));
        },
            (productList) {
          emit(SearchForProductSuccess(product: productList));
        },
      );
    } on Exception catch (e) {
      emit(SearchForProductFailure(errorMessage: e.toString()));
    }
  }
}

