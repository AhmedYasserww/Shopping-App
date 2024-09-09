import 'package:dartz/dartz.dart';
import 'package:shoping_app/core/errors/faliure.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
abstract class HomeRepo {
  Future<Either<Failure, List<String>>> fetchAllCategories();
 Future<Either<Failure, List<ProductModel>>> fetchSpecificProduct({required String category});
  Future<Either<Failure, List<ProductModel>>> fetchTopProduct();

}
