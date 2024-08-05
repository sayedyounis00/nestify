import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/view/widgets/phone_login_body.dart';

class PhonrLoginView extends StatelessWidget {
  const PhonrLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:PhoneLoginBody());
  }
}