import 'package:challenge_2/src/view/screens/auth/auth_screen.dart';
import 'package:challenge_2/src/view/screens/on_boarding_screen.dart';
import 'package:challenge_2/src/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../view/screens/article/article_screen.dart';
import '../view/screens/home/home_screen.dart';
import '../view/screens/main/main_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/search_screen.dart';

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
        route = MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
        break;

      case kOnBoardingScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
        break;
      case kAuthScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
        break;
      case kMainScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
        break;
      case kHomeScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => Offstage(
            offstage:
                ((settings.arguments) as Map<String, dynamic>)['offStage'],
            child: const HomeScreen(),
          ),
        );
        break;
      case kArticleScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => Offstage(
            offstage:
                ((settings.arguments) as Map<String, dynamic>)['offStage'],
            child: ArticleScreen(
                callback:
                    ((settings.arguments) as Map<String, dynamic>)['callback']),
          ),
        );
        break;
      case kSearchScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => Offstage(
            offstage:
                ((settings.arguments) as Map<String, dynamic>)['offStage'],
            child: const SearchScreen(),
          ),
        );
        break;
      case kProfileScreenRoute:
        route = MaterialPageRoute(
          builder: (_) => Offstage(
            offstage:
                ((settings.arguments) as Map<String, dynamic>)['offStage'],
            child: ProfileScreen(),
          ),
        );
        break;
    }
    return route!;
  }
}
