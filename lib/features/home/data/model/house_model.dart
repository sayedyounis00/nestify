class HouseModel {
  final String img, title, place, bd, ba, price, ownerName,category;
  bool isFav;

  HouseModel({
    required this.img,
    required this.title,
    required this.place,
    required this.bd,
    required this.ba,
    required this.price,
    this.isFav = false,
    required this.ownerName,
    required this.category,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      img: json['img'],
      title: json['title'],
      place: json['location'],
      bd: json['bd'],
      ba: json['ba'],
      price: json['price'],
      isFav: json['isFav']??false,
      ownerName: json['owner_name'], category:  json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'title': title,
      'ba': ba,
      'bd': bd,
      'price': price,
      'isFav': isFav,
      'owner_name': ownerName,
      'location': place,
      'category': category,
    };
  }
}
