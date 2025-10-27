class WishModel{
  final String wishId;
  final String productId;
  final String title;
  final List<String> photos;
  final int currentPrice;
  final double rating;
  WishModel({ required this.productId,
      required this.wishId, required this.title, required this.photos, required this.currentPrice, required this.rating});

  factory WishModel.fromJson(Map<String, dynamic>jsonData){
    return WishModel(
        productId: jsonData['product']['_id'],
        wishId: jsonData['_id'],
        title: jsonData['product']['title'],
        photos: List<String>.from(jsonData['product']['photos'].map((e)=>e).toList()),
        currentPrice: jsonData['product']['current_price'],
        rating: 4.2);
  }
}