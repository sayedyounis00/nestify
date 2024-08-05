import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nestify/core/utils/router.dart';
import 'package:nestify/core/utils/routes.dart';
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
    return const GetMaterialApp(
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerate,
      initialRoute: AddRouter.splashViewRoute,
    );
  }
}
