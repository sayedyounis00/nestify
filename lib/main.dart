import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nestify/core/utils/router.dart';
import 'package:nestify/features/home/data/repo/home_repo_imp.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/messages/presentation/view%20model/get_messages%20cubit/get_messages_cubit.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';
import 'package:nestify/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Nestify());
}

class Nestify extends StatelessWidget {
  const Nestify({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImp()),
        ),
        BlocProvider(
          create: (context) => GetMessagesCubit(),
        ),
        BlocProvider(
          create: (context) => NavigateCubit(HomeRepoImp()),
        )
      ],
      child:  const GetMaterialApp(
        transitionDuration: Duration(milliseconds: 450),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerate,
      ),
    );
  }
}
