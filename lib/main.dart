import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nestify/core/utils/router.dart';
import 'package:nestify/core/utils/routes.dart';

void main() {
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
