import 'package:go_router/go_router.dart';
import 'package:shoping_app/features/auth/presentations/views/log_in_view.dart';
import 'package:shoping_app/features/auth/presentations/views/register_view.dart';

import '../../features/onboardingscreen/presentations/views/boarding_view.dart';


abstract class AppRouter {
  static const kRegister = '/register';
  static const kLogin = '/login';


  static const kSplashScreen = '/splashScreen';
  static const kHomeView = '/homeView';
  static const kBoardingView = '/boardingView';
  static const kForgetPassword = '/forgetPassword';
  static const kVerification= '/verification';
  static const kCategoryDetailsView = '/categoryDetailsView';
  static const kRoomDetailsView = '/roomDetailsView';

  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const BoardingView()
        ),
        GoRoute(
            path:kLogin,
            builder: (context, state) => const LogInScreen()
        ),
        GoRoute(
          path: kRegister,
          builder: (context, state) => const RegisterScreen(),
        ),

      ]);
}