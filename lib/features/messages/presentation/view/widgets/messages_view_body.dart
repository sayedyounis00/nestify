import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/messages/presentation/view/widgets/chat_card.dart';

class MessangerViewBody extends StatelessWidget {
  const MessangerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(kUserCol);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Messages',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (context, snapshot) {
              return chatCardHandler(snapshot);
            },
          ),
        ),
      ],
    );
  }

  Widget chatCardHandler(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Center(child: Text('No data found'));
    } else {
      return returnedChatCard(snapshot);
    }
  }

  ListView returnedChatCard(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    var docs = snapshot.data!.docs;
    return ListView.separated(
        itemCount: docs.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(indent: 80, height: 0);
        },
        itemBuilder: (BuildContext context, int index) {
          var data = docs[index].data() as Map<String, dynamic>;
          return ChatCard(
            fullName: data['first_name'] + ' ' + data['last_name'] ?? 'No name',
            userId: '0',
          );
        });
  }
}
