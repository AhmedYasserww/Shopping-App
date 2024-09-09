import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shoping_app/core/errors/faliure.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/search_view/data/repo/search_repo.dart';

import '../../../../core/utils/api_servise.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;
  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<ProductModel>>> searchForProduct({required String product}) async {
    try {
      var data = await apiService.get(endPoint:'products/search?q=$product');
      print("returned data successfully $data");
      List <ProductModel>productList = [];
      if (data['products'] != null) {
        for (var i in data['products']) {
          productList.add(ProductModel.fromJson(i));
        }
      }

      else {
        return Left(ServerFailure(errorMessage: "no item found "));
      }
      return right(productList);
    } on Exception catch (e) {
      if (e is DioError) {
        print("dioErrorException${e.message}");
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }



}

