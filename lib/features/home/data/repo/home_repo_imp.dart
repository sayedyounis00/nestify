import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nestify/core/utils/constant.dart';
import 'package:nestify/features/home/data/model/house_model.dart';
import 'package:nestify/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection(kUserCol).doc(auth.currentUser!.uid).get();
      return snapshot.data()!;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<HouseModel>> getAllHouses() async {
    List<HouseModel> allHousesList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> data =
          await firestore.collection(kPropertiesCol).get();

      for (var doc in data.docs) {
        allHousesList.add(HouseModel.fromJson(doc.data()));
      }

      return allHousesList;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getFavHouses() async {
    List<Map<String, dynamic>> favHousesList = [];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await firestore
          .collection(kPropertiesCol)
          .where('isFav', isEqualTo: true)
          .get();

      for (var doc in data.docs) {
        favHousesList.add(doc.data());
      }

      return favHousesList;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<List<HouseModel>> getFilterdHouses(
      {String? loca,
      String? price,
      String? type,
      String? bed,
      String? category}) async {
    List<HouseModel> filterdHousesList = [];

    QuerySnapshot<Map<String, dynamic>> data = await firestore
        .collection(kPropertiesCol)
        .where(
          'location',
          isEqualTo: loca,
        )
        .where(
          'bd',
          isEqualTo: bed,
        )
        .where(
          'category',
          isEqualTo: type,
        )
        .where(
          'price',
          isEqualTo: price,
        )
        .where(
          'category',
          isEqualTo: category,
        )
        .get();

    for (var doc in data.docs) {
      filterdHousesList.add(HouseModel.fromJson(doc.data()));
    }
    if (filterdHousesList.isEmpty) {
      filterdHousesList = [
        HouseModel(
          img:
              'https://www.shutterstock.com/image-vector/oops-404-error-web-site-260nw-1889722093.jpg',
          title: 'Not Found',
          place: '',
          bd: '',
          ba: '',
          price: '',
          ownerName: '',
          category: '',
          ownernum: '',
          description: '',
        )
      ];
    }

    return filterdHousesList;
  }
}
