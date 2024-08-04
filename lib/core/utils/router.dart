import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/splash/presentation/view/landing_page.dart';
import 'package:nestify/features/auth/presentation/views/login_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.landingPageRoute:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
        case AddRouter.loginPageRoute:
            return CupertinoPageRoute(builder: (_) => const LoginPage());
    default:
      return CupertinoPageRoute(builder: (_) => const LandingPage());
  }
}
