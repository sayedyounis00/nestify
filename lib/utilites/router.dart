import 'package:flutter/cupertino.dart';
import 'package:nestify/presentation/screens/landing_page.dart';
import 'package:nestify/presentation/screens/login_page.dart';
import 'package:nestify/utilites/routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    case AddRouter.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
