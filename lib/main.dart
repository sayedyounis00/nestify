import 'package:flutter/material.dart';

void main() {
  runApp(const Nestify());
}

class Nestify extends StatelessWidget {
  const Nestify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}

