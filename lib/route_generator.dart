import 'package:flutter/material.dart';
import 'package:fluttermobxboilerplate/modules/home/home_screen.dart';
import 'package:fluttermobxboilerplate/modules/onboarding/login/login_screen.dart';
import 'package:fluttermobxboilerplate/modules/onboarding/splash/splash_screen.dart';
import 'package:fluttermobxboilerplate/store/articles/article_store.dart';
import 'package:fluttermobxboilerplate/store/login/login_store.dart';
import 'package:fluttermobxboilerplate/utility/preferences_service.dart';
import 'package:fluttermobxboilerplate/values/imports.dart';

import 'values/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => LoginStore(PreferencesService()),
            child: LoginScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => ArticleStore(),
            child: HomeScreen(),
          ),
        );
      default:
        return _unknownRoute();
    }
  }

  static Route<dynamic> _unknownRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('Under Development'),
        ),
      );
    });
  }
}
