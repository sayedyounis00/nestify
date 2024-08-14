import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/main/presentation/views/main_view.dart';
import 'package:nestify/features/owner%20main/presentation/views/main_owner_view.dart';
import 'package:nestify/features/splash/presentation/view/landing_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      BlocProvider.of<HomeCubit>(context).setUserInfo();
    }

    Future.delayed(
      const Duration(milliseconds: 700),
      () {
        var view = StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (BlocProvider.of<HomeCubit>(context).userStatus == 'Owner') {
                return const MainOwnerView();
              } else {
                return const MainView();
              }
            } else {
              return const LandingView();
            }
          },
        );
        Get.offAll(() => view, transition: nav.Transition.fade);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/justlogo.png'),
      ),
    );
  }
}
