class OwnerState {}

class OwnerInit extends OwnerState {}

class RemoveHouseDone extends OwnerState {}

// class OwnerLoading extends OwnerState {}

class OwnerFalied extends OwnerState {
  final String errMessage;

  OwnerFalied(this.errMessage);
}

final class AddHouseLoading extends OwnerState {}

final class AddHouseFaliure extends OwnerState {
  final String errMessage;

  AddHouseFaliure({required this.errMessage});
}

final class AddHouseSuccess extends OwnerState {}
