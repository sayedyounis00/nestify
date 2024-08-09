import 'package:flutter/material.dart';
import 'package:nestify/features/auth/presentation/view/widgets/user_or_owner_view_body.dart';

class UserOrOwnerView extends StatelessWidget {
  const UserOrOwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Nestify',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: const UserOrOwnerViewBody(),
    );
  }
}
