import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nestify/core/utils/constant.dart';
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
}
