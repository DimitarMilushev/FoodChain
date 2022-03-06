class Product {
  final String name;
  final String description;
  final String thumbnail;
  final double rating;

  const Product(
      {required this.name,
      required this.description,
      required this.thumbnail,
      required this.rating});

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        description = json['description'] as String,
        thumbnail = json['thumbnail'] as String,
        rating = json['rating'] as double;

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'thumbnail': thumbnail,
        'rating': rating
      };
}
