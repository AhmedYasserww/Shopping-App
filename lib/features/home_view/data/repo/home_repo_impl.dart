import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shoping_app/core/errors/faliure.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo.dart';

import '../../../../core/utils/api_servise.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<String>>> fetchAllCategories() async {
    try {
      print('Fetching categories from API');
      var response = await apiService.get(endPoint: "products/category-list");
      print('Response data: ${response}');

      if (response is List) {
        List<String> categoriesList = List<String>.from(response);
        return right(categoriesList);
      } else {
        print('Error: Response is not a List');
        return left(ServerFailure(errorMessage: 'Invalid response format'));
      }
    } on DioException catch (e) {
      print('DioException occurred: ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      print('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchSpecificProduct(
      {required String category}) async {
    try {
      var data = await apiService.get(endPoint: 'products/category/$category');
      print("returned data successfully $data");
      List <ProductModel>product = [];
      if (data['products'] != null) {
        for (var i in data['products']) {
          product.add(ProductModel.fromJson(i));
        }
      }

      else {
        return Left(ServerFailure(errorMessage: "no item found "));
      }
      return right(product);
    } on Exception catch (e) {
      if (e is DioError) {
        print("dioErrorException${e.message}");
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchTopProduct() async {
    try {
      var data = await apiService.get(
          endPoint: 'products?limit=30&skip=74&select=title,price,description,thumbnail');
      print("returned data successfully $data");
      List <ProductModel>product = [];
      if (data['products'] != null) {
        for (var i in data['products']) {
          product.add(ProductModel.fromJson(i));
        }
      }

      else {
        return Left(ServerFailure(errorMessage: "no item found "));
      }
      return right(product);
    } on Exception catch (e) {
      if (e is DioError) {
        print("dioErrorException${e.message}");
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

