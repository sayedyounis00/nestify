import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';

class Helper {
  static void updateFavouriteMethod(HouseModel house, context) {
    house.isFav = !house.isFav;
    if (house.isFav) {
      BlocProvider.of<HomeCubit>(context).setToFavourite();
    } else {
      BlocProvider.of<HomeCubit>(context).removeFromFavourite();
    }
  }
}
