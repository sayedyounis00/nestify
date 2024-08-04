import 'package:flutter/material.dart';
import 'package:nestify/core/utils/router.dart';

void main() {
  runApp(const Nestify());
}

class Nestify extends StatelessWidget {
  const Nestify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        onGenerateRoute:onGenerate,
      ),
    );
  }
}

