import 'package:dartz/dartz.dart';
import 'package:shoping_app/core/errors/faliure.dart';
abstract class HomeRepo {
  Future<Either<Failure, List<String>>> fetchAllCategories();



  // Future<Either<Failure, List<CategoriesModel>>> fetchAllCategories();
  // Future<Either<Failure,ProductModelAndHisVariants>> fetchOneProduct({required int id});

}
