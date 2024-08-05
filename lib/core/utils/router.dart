import 'package:flutter/cupertino.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/auth/presentation/view/login_view.dart';
import 'package:nestify/features/splash/presentation/view/landing_view.dart';
import 'package:nestify/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AddRouter.landingListViewRoute:
      
        return CupertinoPageRoute(builder: (_) => const LandingView());
      
    case AddRouter.splashViewRoute:
      return CupertinoPageRoute(builder: (_) => const SplashView());
        case AddRouter.verificationRoute:
      
        return CupertinoPageRoute(builder: (_) => const VerificationView());
      
    case AddRouter.verifiedRoute:
      
        return CupertinoPageRoute(builder: (_) => const VerifiedView());
      
    case AddRouter.homeView:
      
        return CupertinoPageRoute(builder: (_) => const HomeView());
        case AddRouter.loginViewRoute:
      return CupertinoPageRoute(builder: (_) => const LoginView());
    case AddRouter.signupViewRoute:
      return CupertinoPageRoute(builder: (_) => const SignupView());
     
    default:
      return CupertinoPageRoute(builder: (_) => const LandingView());
  }
}
