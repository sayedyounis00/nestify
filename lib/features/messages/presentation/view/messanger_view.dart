import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/messages/presentation/view/widgets/messages_view_body.dart';

class MessangerView extends StatelessWidget {
  const MessangerView({
    super.key,  this.house,
  });
  final HouseModel? house;

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
      body:  const MessangerViewBody(),
    );
  }
}
