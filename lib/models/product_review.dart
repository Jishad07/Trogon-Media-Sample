
class Review {
  final double rating;
  final String comment;

  Review({required this.rating, required this.comment});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating']?.toDouble() ?? 0.0,
      comment: json['comment'] ?? '',
    );
  }
}
