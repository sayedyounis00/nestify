import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/messages/data/message_model.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessageState> {
  GetMessagesCubit() : super(GetMessagesInitial());

  void fetchMessageInformation() {
    emit(GetMessagesLoading());

    try {
      FirebaseFirestore.instance
          .collection('messages')
          .orderBy('message_time', descending: true)
          .snapshots()
          .listen((snapshot) {
        // Map Firestore documents to a list of MessageModel
        final List<MessageModel> messages = snapshot.docs
            .map((doc) => MessageModel.fromJson(doc.data()))
            .toList();

        log('Fetched ${messages.length} messages');
        emit(GetMessagesSuccess(messages: messages));
      });
    } catch (e) {
      emit(GetMessagesFailure(errMessage: e.toString()));
    }
  }
}
