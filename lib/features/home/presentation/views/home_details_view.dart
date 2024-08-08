import 'package:flutter/material.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/views/widgets/details/home_details_view_body.dart';

class HomeDetailsView extends StatelessWidget {
  const HomeDetailsView({super.key, required this.house});
  final HouseModel house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeDetailsViewBody(house: house),
    );
  }
}
