import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/presentation/view%20model/house%20cubit/add_house_cubit.dart';
import 'package:nestify/features/home/presentation/views/widgets/add_property_view_body.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => AddHouseCubit(),
        child: const AddPropertyViewBody(),
      ),
    );
  }
}
