import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/data/model/user.dart';
import 'package:nestify/features/home/data/repo/home_repo.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_state.dart';

class NavigateCubit extends Cubit<NavigateState> {
  NavigateCubit(this.homeRepo) : super(InitNavState());
  HomeRepo homeRepo;
  String userStatus = 'user status';
  String ownerAbout = 'Owner About';

  UserModel user = UserModel(
    firstName: 'firstName',
    lastName: 'lastName',
    phone: 'phone',
    email: 'email',
    userId: 'userId',
    createdAt: 'createdAt',
    fullName: 'fullName',
    userStatus: 'userStatus',
  );

  Future<UserModel> setUserInfo() async {
    emit(LoadingInfo());
    Map<String, dynamic> userInfo = await homeRepo.getUserInfo();
    user = UserModel(
      firstName: userInfo['first_name'],
      lastName: userInfo['last_name'],
      phone: userInfo['phone_number'],
      email: userInfo['email'],
      userId: userInfo['user_id'],
      createdAt: userInfo['createdAt'],
      fullName: userInfo['first_name'] + userInfo['last_name'],
      userStatus: userInfo['user_status'],
      ownerAbout: userInfo['owner_about'],
    );
    userStatus = user.userStatus;
    emit(InfoGetDone());
    return user;
  }

  void setUserStatus({required String status}) {
    userStatus = status;
  }

  void setOwnerAbout({required String about}) {
    ownerAbout = about;
  }
}
