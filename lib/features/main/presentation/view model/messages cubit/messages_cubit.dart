import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());
}
