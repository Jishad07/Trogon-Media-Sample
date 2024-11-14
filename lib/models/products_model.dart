
class Review {
  final int userId;
  final double rating;
  final String comment;

  Review({
    required this.userId,
    required this.rating,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userId: json['user_id'] ?? 0, // Use a fallback in case of null
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
    );
  }
}

class Product {
  final int productId;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String imageUrl;
  final double discount;
  final bool availability;
  final String brand;
  final String category;
  final double rating;
  final List<Review> reviews;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.imageUrl,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Safe handling of null values with default values
    var reviewsJson = json['reviews'] ?? [];
    List<Review> reviewsList = List<Review>.from(
        reviewsJson.map((item) => Review.fromJson(item)));

    return Product(
      productId: json['product_id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      description: json['description'] ?? 'No description available.',
      price: (json['price'] ?? 0.0).toDouble(),
      unit: json['unit'] ?? 'Piece',
      imageUrl: json['image'] ?? '',
      discount: (json['discount'] ?? 0.0).toDouble(),
      availability: json['availability'] ?? false,
      brand: json['brand'] ?? 'Unknown',
      category: json['category'] ?? 'Unknown',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviews: reviewsList,
    );
  }
}
