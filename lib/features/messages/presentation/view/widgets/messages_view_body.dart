import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_card.dart';

class MessangerViewBody extends StatelessWidget {
  const MessangerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    //! here is where i should recieve house owner name 
    // String houseOwner = ModalRoute.of(context)!.settings.arguments as String;
    DocumentReference ownerChats = FirebaseFirestore.instance
        .collection('usersInfo')
        .doc(auth.currentUser!.uid);
    CollectionReference chats = ownerChats.collection('ownerContactWith');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Messages',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
        Expanded(
          child:FutureBuilder(
            //!instead of [/*fullName*/] i should put house onwer which i should recieve up.
            future: chats.doc('fullName').get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Map<String, dynamic> ownerInfo =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ListView.builder(
                  itemCount: ownerInfo.length,
                  itemBuilder: (context, index) {
                    return ChatCard(
                      fullName: ownerInfo['ownerName'],
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
