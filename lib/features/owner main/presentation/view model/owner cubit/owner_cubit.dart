import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/data/model/user.dart';
import 'package:nestify/features/home/presentation/view%20model/home%20cubit/home_cubit.dart';
import 'package:nestify/features/owner%20main/presentation/view%20model/owner%20cubit/owner_state.dart';

class OwnerCubit extends Cubit<OwnerState> {
  OwnerCubit() : super(OwnerInit());

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<HouseModel>> getMyHouses(context) async {
    List<HouseModel> myHouses = [];
    UserModel user = BlocProvider.of<HomeCubit>(context).user;
    var data = await firestore
        .collection(kPropertiesCol)
        .where('owner_name', isEqualTo: user.fullName)
        .get();

    for (var doc in data.docs) {
      myHouses.add(HouseModel.fromJson(doc.data()));
    }
    return myHouses;
  }

  void removeHouse({required String docName}) async {
    await firestore.collection(kPropertiesCol).doc(docName).delete();
  }
}
