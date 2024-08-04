import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/splash/presentation/view/landing_page.dart';
import 'package:nestify/features/splash/presentation/view/login_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    case AddRouter.landingPageRoute:
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
