import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


}
