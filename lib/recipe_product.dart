import 'package:hive/hive.dart';

part 'recipe_product.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final double rating;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'] as int,
      name: map['title'] as String,
      image: map['imageUrl'] as String,
      price: map['price'] as String,
      rating: map['averageRating'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': name,
      'image': image,
      'price': price,
      'rating': rating,
    };
  }
}
