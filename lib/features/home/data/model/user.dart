class UserModel {
  String createdAt,
      email,
      firstName,
      lastName,
      phone,
      userId,
      fullName,
      userStatus;
  String? ownerAbout;
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.userId,
    required this.createdAt,
    required this.userStatus,
    this.ownerAbout,
  });
}
