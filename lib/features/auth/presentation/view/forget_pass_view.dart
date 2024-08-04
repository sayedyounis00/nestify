import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/widgets/forget_pass_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgetPassBody(),
    );
  }
}
