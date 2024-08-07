import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/home/presentation/views/home_view.dart';
import 'package:nestify/features/splash/presentation/view/landing_view.dart';
import 'package:nestify/features/splash/presentation/view/widgets/splash_view_body.dart';

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
      const Duration(seconds: 2),
      () {
        var view = StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeView();
            } else {
              return const LandingView();
            }
          },
        );
        Get.off(() => view);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
