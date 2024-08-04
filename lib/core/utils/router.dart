import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/splash/presentation/view/landing_list_view.dart';
import 'package:nestify/features/auth/presentation/views/login_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.landingListViewRoute:
      return CupertinoPageRoute(builder: (_) => const LandingListView());
    case AddRouter.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
    default:
      return CupertinoPageRoute(builder: (_) => const LandingListView());
  }
}
