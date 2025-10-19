import 'package:ostadecommerce/features/shared/data/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel product;
  int quantity;
  String? color;
  String? size;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });

  factory CartItemModel.formJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      id: jsonData['_id'],
      product: ProductModel.fromJson(jsonData['product']),
      quantity: jsonData['quantity'],
      size: jsonData['size'],
      color: jsonData['color'],
    );
  }
}
