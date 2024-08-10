import 'package:bloc/bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

part 'house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  HouseCubit() : super(HouseInitial());

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');
  void addHouse({
    required String ownerName,
    required String houseTitle,
    required String location,
    required String bd,
    required String ba,
    required String price,
    required String imageUrl,
  }) {
    try {
      emit(AddHouseLoading());
      properties.doc(houseTitle).set({
        'owner_name': ownerName,
        'title': houseTitle,
        'img': imageUrl,
        'location': location,
        'bd': bd,
        'ba': ba,
        'price': price,
      });
      emit(AddHouseSuccess());
    } catch (e) {
      emit(AddHouseFaliure(errMessage: e.toString()));
    }
  }
}
