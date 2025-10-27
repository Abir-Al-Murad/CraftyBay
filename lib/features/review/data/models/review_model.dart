class ReviewModel {
  final String id;
  final String productId;
  final String userId;
  final String firstName;
  final String lastName;
  final int rating;
  final String comment;

  ReviewModel({
    required this.productId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.comment,
    required this.id,
    required this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
      userId: jsonData['_id'],
      firstName: jsonData['user']['first_name'],
      lastName: jsonData['user']['last_name'],
      comment: jsonData['comment'],
      id: jsonData['user']['_id'],
      rating: (jsonData['rating'] ?? 0).toInt(),
      productId: jsonData['product']['_id'],
    );
  }
}
