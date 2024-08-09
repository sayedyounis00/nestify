import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/faviorite/presentation/view/widgets/fav_view_body.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
          ),
        ],
      ),
      body: const FavViewBody(),
    );
  }
}
