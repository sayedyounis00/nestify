part of 'add_house_cubit.dart';

sealed class AddHouseState {}

final class AddHouseInitial extends AddHouseState {}

final class AddHouseLoading extends AddHouseState {}

final class AddHouseFaliure extends AddHouseState {
  final String errMessage;

  AddHouseFaliure({required this.errMessage});
}

final class AddHouseSuccess extends AddHouseState {}
