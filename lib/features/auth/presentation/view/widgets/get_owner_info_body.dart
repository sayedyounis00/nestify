import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';

class GetOwnerInfoBody extends StatelessWidget {
  const GetOwnerInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(100),
                    hintText: 'About'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Add about me ',
                onPressed: () {
                  Navigator.pushNamed(context, AddRouter.signupViewRoute);
                },
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
