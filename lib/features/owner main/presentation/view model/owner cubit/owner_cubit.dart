import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/data/model/user.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_state.dart';
import 'package:nestify/features/splash/presentation/view%20model/navigate%20cubit/navigate_cubit.dart';

class OwnerCubit extends Cubit<OwnerState> {
  OwnerCubit() : super(OwnerInit());

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference properties =
      FirebaseFirestore.instance.collection('properties');

  Future<List<HouseModel>> getMyHouses({context, String? ownerName}) async {
    try {
      // emit(OwnerLoading());
      List<HouseModel> myHouses = [];
      UserModel user = BlocProvider.of<NavigateCubit>(context).user;
      var data = await firestore
          .collection(kPropertiesCol)
          .where('owner_name', isEqualTo: ownerName ?? user.fullName)
          .get();

      for (var doc in data.docs) {
        myHouses.add(HouseModel.fromJson(doc.data()));
      }
      emit(OwnerInit());
      return myHouses;
    } catch (e) {
      rethrow;
    }
  }

  void removeHouse({required String docName}) async {
    try {
      await firestore.collection(kPropertiesCol).doc(docName).delete();
      emit(RemoveHouseDone());
    } catch (e) {
      emit(OwnerFalied(e.toString()));
    }
  }

  void addHouse({
    required String ownerName,
    required String houseTitle,
    required String location,
    required String bd,
    required String ba,
    required String price,
    required String imageUrl,
    required String category,
    required String ownernum,
    required String description,
  }) {
    try {
      emit(AddHouseLoading());
      properties.doc(houseTitle).set({
        'owner_name': ownerName,
        'category': category,
        'title': houseTitle,
        'img': imageUrl,
        'location': location,
        'bd': bd,
        'ba': ba,
        'price': price,
        'owner_um': ownernum,
        'desc': description,
      });
      emit(AddHouseSuccess());
    } catch (e) {
      emit(AddHouseFaliure(errMessage: e.toString()));
    }
  }
}
