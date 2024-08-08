part of 'add_message_cubit.dart';
sealed class AddMessageState {}

final class AddMessageInitial extends AddMessageState {}

final class AddMessageLoading extends AddMessageState {}

final class AddMessageSuccess extends AddMessageState {}

final class AddMessageFailure extends AddMessageState {
  final String errMessage;

  AddMessageFailure({required this.errMessage});
}
