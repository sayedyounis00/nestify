part of 'house_cubit.dart';

sealed class HouseState {}

final class HouseInitial extends HouseState {}

final class AddHouseLoading extends HouseState {}

final class AddHouseFaliure extends HouseState {
  final String errMessage;

  AddHouseFaliure({required this.errMessage});
}

final class AddHouseSuccess extends HouseState {}
