import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_card.dart';

class MessangerViewBody extends StatelessWidget {
  const MessangerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference ownerChats = FirebaseFirestore.instance
        .collection('usersInfo')
        .doc(auth.currentUser!.uid);
    CollectionReference chats = ownerChats.collection('ownerContactWith');
    int ownersCount = 0;
    void getDocumentCount() async {
      QuerySnapshot querySnapshot = await chats.get();
      int documentCount = querySnapshot.docs.length;
      ownersCount = documentCount;
    }

    getDocumentCount();

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
          child: FutureBuilder(
            future: chats.doc('yousefmahmoud').get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Map<String, dynamic> ownerInfo =
                  snapshot.data!.data() ;
              log(snapshot.data.toString());
              return FutureBuilder<Object>(
                future: null,
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: ownersCount,
                      itemBuilder: (context, index) {
                        return ChatCard(
                          fullName: ownerInfo['ownerName'],
                        );
                      });
                }
              );
            },
          ),
        )
      ],
    );
  }
}
