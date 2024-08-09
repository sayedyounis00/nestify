import 'package:flutter/material.dart';

class GetOwnerInfoBody extends StatelessWidget {
  const GetOwnerInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'About'
          ),
        )
      ],
    );
  }
}