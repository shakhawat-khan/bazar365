class CardModel {
  final int? id;
  final String? image;
  final String? price;
  final String? name;
  final String? discount;
  CardModel({
    this.id,
    this.image,
    this.price,
    this.name,
    this.discount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'name': name,
      'discount': discount,
    };
  }
}
