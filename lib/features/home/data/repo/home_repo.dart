abstract class HomeRepo {
  Future<Map<String, dynamic>> getUserInfo();
  Future<List<Map<String, dynamic>>> getAllHouses();
  addHouse();
}