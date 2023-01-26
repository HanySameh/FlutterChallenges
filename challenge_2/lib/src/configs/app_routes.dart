import 'package:challenge_2/src/view/screens/auth/auth_screen.dart';
import 'package:challenge_2/src/view/screens/on_boarding_screen.dart';
import 'package:challenge_2/src/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String kSplashRoute = '/';
  static const String kMainScreenRoute = '/mainScreen';
  static const String kHomeScreenRoute = '/homeScreen';
  static const String kOnBoardingScreenRoute = '/onBoardingScreen';
  static const String kAuthScreenRoute = '/AuthScreen';
  static const String kArticleScreenRoute = '/ArticleScreen';
  static const String kSearchScreenRoute = '/SearchScreen';
  static const String kProfileScreenRoute = '/ProfileScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route? route;

    switch (settings.name) {
      case kSplashRoute:
        route = MaterialPageRoute(builder: (_) => const SplashScreen());
        break;

      case kOnBoardingScreenRoute:
        route = MaterialPageRoute(builder: (_) => OnBoardingScreen());
        break;
      case kAuthScreenRoute:
        route = MaterialPageRoute(builder: (_) => const AuthScreen());
        break;
    }
    return route!;
  }
}
