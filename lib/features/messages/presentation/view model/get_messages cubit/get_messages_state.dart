part of 'get_messages_cubit.dart';

abstract class GetMessageState {}

class GetMessagesInitial extends GetMessageState {}

class GetMessagesLoading extends GetMessageState {}

class GetMessagesSuccess extends GetMessageState {
  final List<MessageModel> messages;

  GetMessagesSuccess({required this.messages});
}

class GetMessagesFailure extends GetMessageState {
  final String errMessage;

  GetMessagesFailure({required this.errMessage});
}
