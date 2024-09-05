
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shoping_app/core/utils/api_servise.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo_impl.dart';

final getIt=GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(apiService: getIt.get<ApiService>()));
}