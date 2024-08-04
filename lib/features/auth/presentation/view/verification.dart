import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/auth/presentation/widgets/input_circule.dart';
import 'package:nestify/features/splash/presentation/view/widgets/custom_button.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'OTP Verification',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Enter the one-yime code sent to the phone nomber',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              '+20 1143825523',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: myWidget(4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Did\'t you recieve the code ?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend code',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
            CustomButton(
              width: double.infinity,
              onTap: () {},
              text: 'Verify',
              color: AppColor.primaryColor,
              textColor: AppColor.secColor4,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> myWidget(int count) {
    return List.generate(count, (i) => const InputCircule()).toList();
  }
}
