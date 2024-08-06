import 'package:flutter/material.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0x3D9E9E9E),
            child: Icon(Icons.person),
          ),
          SpaceH(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text('Email',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColor.secColor3,
                      height: 1)),
            ],
          )
        ],
      ),
    );
  }
}
