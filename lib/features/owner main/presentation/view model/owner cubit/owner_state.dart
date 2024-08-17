class OwnerState {}

class OwnerInit extends OwnerState {}

class OwnerDone extends OwnerState {}
class OwnerLoading extends OwnerState {}

class OwnerFalied extends OwnerState {
  final String errMessage;

  OwnerFalied(this.errMessage);
}
