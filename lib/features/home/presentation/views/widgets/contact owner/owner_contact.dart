import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;
import 'package:nestify/core/theme/app_color.dart';
import 'package:nestify/core/widgets/space.dart';
import 'package:nestify/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/messages/presentation/view/chat_view.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class OwnerContact extends StatelessWidget {
  const OwnerContact({
    super.key,
    required this.house,
  });
  final HouseModel house;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
            text: 'Message',
            onPressed: () {
              addOwnerContactIfRenter(
                userId: BlocProvider.of<NavigateCubit>(context).user.userId,
                ownerName: house.ownerName,
                ownerPhone: house.ownernum,
              );
              Get.to(() => ChatView(fullName: house.ownerName),transition: nav.Transition.fade);
            },
            color: AppColor.primaryColor),
        const SpaceH(10),
        CustomButton(
          text: 'Call',
          onPressed: () async {
            launchUrl(Uri.parse('tel://${house.ownernum}'));
          },
          color: AppColor.secColor4,
          foreCol: AppColor.primaryColor,
        ),
      ],
    );
  }

  void addOwnerContactIfRenter(
      {required String userId,
      required String ownerName,
      required String ownerPhone}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference userDocRef = FirebaseFirestore.instance
        .collection('usersInfo')
        .doc(auth.currentUser!.uid);

    DocumentSnapshot userDoc = await userDocRef.get();

    if (userDoc.exists) {
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

      if (userData['user_status'] == 'renter') {
        await userDocRef.collection('ownerContactWith').doc(ownerName).set({
          'ownerName': ownerName,
          'ownerPhone': ownerPhone,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }
}
