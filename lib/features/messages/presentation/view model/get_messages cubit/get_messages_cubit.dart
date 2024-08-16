import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/messages/data/message_model.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessageState> {
  GetMessagesCubit() : super(GetMessagesInitial());
  String lastMessages = '';

  void fetchMessageInformation() {
    emit(GetMessagesLoading());
    try {
      FirebaseFirestore.instance
          .collection('messages')
          .orderBy('message_time', descending: true)
          .snapshots()
          .listen((snapshot) {
        final messages = snapshot.docs
            .map((doc) => MessageModel.fromJson(doc.data()))
            .toList();
        emit(GetMessagesSuccess(messages: messages));
      });
    } catch (e) {
      emit(GetMessagesFailure(errMessage: e.toString()));
    }
  }

  String getLastMessage() {
    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('message_time', descending: true)
        .snapshots()
        .listen(
      (snap) {
        lastMessages =
            MessageModel.fromJson(snap.docs.first.data()).messageText;
        emit(state);
      },
    );
    return lastMessages;
  }
}
