import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/home/data/model/user.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0x3D9E9E9E),
            child: Icon(Icons.person),
          ),
          const SpaceH(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.firstName} ${user.lastName}'.capitalize ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              Text(user.userStatus,
                  style: const TextStyle(
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
