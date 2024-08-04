import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/auth/presentation/view/verification.dart';
import 'package:nestify/features/auth/presentation/widgets/login_view_body.dart';
import 'package:nestify/features/splash/presentation/view/landing_list_view.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.landingListViewRoute:
      return CupertinoPageRoute(builder: (_) => const LandingListView());
    case AddRouter.verificationRoute:
      return CupertinoPageRoute(builder: (_) => const VerificationPage());
    case AddRouter.loginPageRoute:
      return CupertinoPageRoute(builder: (_) => const LoginViewBody());
    default:
      return CupertinoPageRoute(builder: (_) => const LandingListView());
  }
}
