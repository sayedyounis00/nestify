import 'package:nestify/features/home/data/model/house_model.dart';

class HousesData {
  static List<HouseModel> houses = [
    HouseModel(
      img: 'assets/images/villa1.jpg',
      title: 'Punta Cana Villa',
      place: 'South Pointer Park, Miami, Florida.',
      bd: '16',
      ba: '9',
      price: '5,450', isFav: false,
    ),
    HouseModel(
      img: 'assets/images/villa2.jpg',
      title: 'Focla Villa',
      place: 'Tanta, Egypt',
      bd: '11',
      ba: '4',
      price: '20,000', isFav: false,
    ),
  ];
}
