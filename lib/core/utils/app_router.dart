import 'package:go_router/go_router.dart';
import 'package:shoping_app/features/auth/presentations/views/log_in_view.dart';
import 'package:shoping_app/features/auth/presentations/views/register_view.dart';
import 'package:shoping_app/features/cart_view/presentations/views/cart_view.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/presentations/views/home_view.dart';
import 'package:shoping_app/features/home_view/presentations/views/navigation_bar.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/product_details_view_body.dart';
import 'package:shoping_app/features/onboardingscreen/presentations/views/splash_view.dart';
import 'package:shoping_app/features/search_view/presentations/views/sarch_view.dart';
import '../../features/home_view/presentations/views/widgets/categories/category_details_view_body.dart';
abstract class AppRouter {
  static const kRegister = '/register';
  static const kLogin = '/login';
  static const kHomeView = '/homeView';
  static const kCategoryDetailsView = '/categoryDetailsView';
  static const kNavigationBar = '/navigationBar';
  static const kProductDetailsView = '/ProductDetailsViewBody';
  static const kCartView= '/cartView';
  static const kSearchView= '/searchView';
  static const kOnboardingView = '/onBoardingView';




  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const SplashView()
        ),
        GoRoute(
            path:kLogin,
            builder: (context, state) => const LogInScreen()
        ),
        GoRoute(
          path: kRegister,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomeView()
        ),
        GoRoute(
            path: kNavigationBar,
            builder: (context, state) => const NavigationBar()
        ),
        GoRoute(
          path: kCategoryDetailsView,
          builder: (context, state) {
            // Retrieve the `extra` parameter from the route state
            final category = state.extra as String?;
            return CategoryDetailsViewBody(category: category!);
          },
        ),
        GoRoute(
          path: AppRouter.kProductDetailsView,
          builder: (context, state) {
            final productModel = state.extra as ProductModel;
            return ProductDetailsViewBody(productModel: productModel);
          },
        ),
        GoRoute(
          path: AppRouter.kCartView,
          builder: (context, state) => const CartView()

        ),
        GoRoute(
            path: AppRouter.kSearchView,
            builder: (context, state) => const SearchView()

        ),

      ]);
}