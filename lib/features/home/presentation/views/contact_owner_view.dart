import 'package:flutter/material.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/contact%20owner/owner_info.dart';

class ContactOwnerView extends StatelessWidget {
  const ContactOwnerView({super.key,  this.house});
  final HouseModel? house;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Contact Owner',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: OwnerInfo(house:house! ,),
          ),
        ),
      ),
    );
  }
}
