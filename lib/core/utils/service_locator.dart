import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoping_app/core/utils/api_servise.dart';
import 'package:shoping_app/features/favorite_view/presentation/manager/add_product_to_favorite_cubit.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo_impl.dart';

import '../../features/cart_view/presentations/manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: getIt.get<ApiService>()));

  // Register AddProductToFavoriteCubit
  getIt.registerSingleton<AddProductToFavoriteCubit>(AddProductToFavoriteCubit());
  getIt.registerSingleton<AddProductToCartCubit>(AddProductToCartCubit());

}
