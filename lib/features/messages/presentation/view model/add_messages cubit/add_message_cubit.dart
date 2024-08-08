import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'add_message_state.dart';

class AddMessageCubit extends Cubit<AddMessageState> {
  AddMessageCubit() : super(AddMessageInitial());
  CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
void addMessageDetail({required String messageText,required String userID}) {
    emit(AddMessageLoading());
    try {
      message.add({
        'message_text': messageText,
        'user_id':userID ,
        'message_time': DateFormat('h:mm:ss a').format(DateTime.now()),
      });
      emit(AddMessageSuccess());
    } catch (e) {
      emit(AddMessageFailure(errMessage: e.toString()));
    }
  }
}
