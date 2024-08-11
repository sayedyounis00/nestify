import 'package:nestify/features/home/data/model/house_model.dart';

class CategoryData {
  static final List<String> categories = [
    'Villa',
    'House',
    'Hotel',
    'Tent',
    'Camp'
  ];
  static final List<String> selectedCategory = [];
  static    List<HouseModel> filteredHouses=[];
}
