class HouseModel {
  final String img,
      title,
      place,
      bd,
      ba,
      price,
      ownerName,
      category,
      ownernum,
      reviewNum,
      description;
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
    required this.ownernum,
    required this.reviewNum,
    required this.description,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      img: json['img'],
      title: json['title'],
      place: json['location'],
      bd: json['bd'],
      ba: json['ba'],
      price: json['price'],
      isFav: json['isFav'] ?? false,
      ownerName: json['owner_name'],
      category: json['category'],
      ownernum: json['owner_um'],
      reviewNum: json['reviewNum'],
      description: json['desc'],
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
      'owner_um': ownernum,
      'location': place,
      'category': category,
      'review_num': reviewNum,
      'desc': description,
    };
  }
}
