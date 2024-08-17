import 'package:flutter/material.dart';
import 'package:nestify/features/owner%20main/presentation/views/widgets/add_property_view_body.dart';

class AddPropertyView extends StatelessWidget {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(child: AddPropertyViewBody()),
      )),
    );
  }
}
