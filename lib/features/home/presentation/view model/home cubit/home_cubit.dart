import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/data/model/user.dart';
import 'package:nestify/features/home/data/repo/home_repo.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;
  UserModel user = UserModel(
      firstName: 'firstName',
      lastName: 'lastName',
      phone: 'phone',
      email: 'email',
      userId: 'userId',
      createdAt: 'createdAt');

  void setUserInfo() async {
    Map<String, dynamic> userInfo = await homeRepo.getUserInfo();
    user = UserModel(
      firstName: userInfo['first_name'],
      lastName: userInfo['last_name'],
      phone: userInfo['phone_number'],
      email: userInfo['email'],
      userId: userInfo['user_id'],
      createdAt: userInfo['createdAt'],
    );
  }
}
