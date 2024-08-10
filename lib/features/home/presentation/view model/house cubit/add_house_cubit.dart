import 'package:bloc/bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_house_state.dart';

class AddHouseCubit extends Cubit<AddHouseState> {
  AddHouseCubit() : super(AddHouseInitial());

  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');
  void addHouse({
    required String ownerName,
    required String houseTitle,
    required String location,
    required String bd,
    required String  ba,
    required String price,
    required String imageUrl,
  }) {
    try {
      emit(AddHouseLoading());
      properties.add({
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
