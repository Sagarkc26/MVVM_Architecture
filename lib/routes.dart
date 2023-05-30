import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routeName.dart';
import 'package:mvvm_architecture/view/homepage.dart';
import 'package:mvvm_architecture/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text("No routes find")),
          ),
        );
    }
  }
}
