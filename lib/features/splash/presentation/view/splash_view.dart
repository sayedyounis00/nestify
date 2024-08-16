import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/main/presentation/views/main_view.dart';
import 'package:nestify/features/owner%20main/presentation/views/main_owner_view.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_state.dart';
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
      BlocProvider.of<NavigateCubit>(context).setUserInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigateCubit, NavigateState>(
      builder: (context, state) {
        if (state is InfoGetDone) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (BlocProvider.of<NavigateCubit>(context).userStatus ==
                    'Owner') {
                  return const MainOwnerView();
                } else {
                  return const MainView();
                }
              } else {
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                    child: Image.asset('assets/images/justlogo.png'),
                  ),
                );
              }
            },
          );
        } else if (state is LoadingInfo) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Image.asset('assets/images/justlogo.png'),
            ),
          );
        } else {
          return const LandingView();
        }
      },
    );
  }
}
