import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/view/widgets/get_owner_info_body.dart';

class GetAboutOwnerView extends StatelessWidget {
  const GetAboutOwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GetOwnerInfoBody(),
    );
  }
}