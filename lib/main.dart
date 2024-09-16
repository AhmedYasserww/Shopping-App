import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/cart_view/data/models/cart_item_model.dart';
import 'package:shoping_app/features/favorite_view/data/models/product_faviorite_model.dart';
import 'package:shoping_app/features/favorite_view/presentation/manager/add_product_to_favorite_cubit.dart';

import 'core/utils/service_locator.dart';
import 'features/cart_view/presentations/manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
import 'features/search_view/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductFavoriteModelAdapter());
  Hive.registerAdapter(CartItemModelAdapter());
  await Hive.openBox<ProductFavoriteModel>(kFavoriteBox);
  await Hive.openBox<CartItemModel>(kCartBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AddProductToFavoriteCubit>(
              create: (context) => getIt<AddProductToFavoriteCubit>(),
            ),
            BlocProvider<AddProductToCartCubit>(
              create: (context) => getIt<AddProductToCartCubit>(),
            ),

            BlocProvider<SearchForProductCubit>(
              create: (context) =>getIt<SearchForProductCubit>(),
            ),

          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(textTheme: GoogleFonts.montagaTextTheme()),
          ),
        );
      },
    );
  }
}
