import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/utils/routes.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class GetOwnerInfoBody extends StatelessWidget {
  const GetOwnerInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Add some informtion about you'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Provide us some info about you '),
            Center(
              child: TextFormField(
                onChanged: (value) {
                  BlocProvider.of<HomeCubit>(context).ownerAbout=value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  contentPadding: EdgeInsets.all(100),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Next',
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
