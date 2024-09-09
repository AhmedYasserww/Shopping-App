import 'package:dartz/dartz.dart';
import 'package:shoping_app/core/errors/faliure.dart';

import '../../../home_view/data/models/ProductModel.dart';

abstract class SearchRepo {

  Future<Either<Failure, List<ProductModel>>>searchForProduct ({required String product});

}