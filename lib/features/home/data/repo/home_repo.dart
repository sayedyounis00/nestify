import 'package:nestify/features/home/data/model/house_model.dart';

abstract class HomeRepo {
  Future<Map<String, dynamic>> getUserInfo();
  Future<List<HouseModel>> getAllHouses();
  Future<List<Map<String, dynamic>>> getFavHouses();
  Future<List<HouseModel>> getFilterdHouses({String? loca, String? price, String? owner, String? bed});
}
