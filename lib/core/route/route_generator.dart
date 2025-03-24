import 'package:flutter/material.dart';
import 'package:group414/core/route/route_names.dart';
import 'package:group414/features/home_page.dart';
import '../../features/auth/presentation/pages/sign_in_page.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      // case RouteNames.byCategoryPage:
      //   final categoryData = routeSettings.arguments as Map<String, String>;
      //   return MaterialPageRoute(
      //       builder: (_) => ProductByCategoryPage(data: categoryData));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
