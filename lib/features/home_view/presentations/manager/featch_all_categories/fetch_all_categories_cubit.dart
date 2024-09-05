import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo.dart';

import '../../../../../core/errors/faliure.dart';

class FetchAllCategoriesCubit extends Cubit<List<String>> {
  FetchAllCategoriesCubit(this.homeRepo) : super([]);
  final HomeRepo homeRepo;

  Future<void> getAllCategories() async {
    print('Fetching all categories');
    try {
      final Either<Failure, List<String>> result = await homeRepo.fetchAllCategories();
      result.fold(
            (failure) {
          // Handle the failure case, maybe emit an empty list or show an error
          print('Error: ${failure.errorMessage}');
          emit([]);
        },
            (categories) {
          // Emit the list of categories if successful
          print('Categories fetched successfully: $categories');
          emit(categories);
        },
      );
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
