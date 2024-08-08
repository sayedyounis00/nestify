import 'package:flutter/material.dart';
import 'package:nestify/core/utils/styles.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Property Descriotion',
              style: Styles.style18.copyWith(fontSize: 15.5)),
          Text(
            'Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion Property Descriotion',
            style: Styles.styleDesc,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
