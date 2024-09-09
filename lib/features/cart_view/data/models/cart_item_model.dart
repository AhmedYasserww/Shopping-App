import 'package:hive/hive.dart';

import '../../../home_view/data/models/ProductModel.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 2)
class CartItemModel {
  @HiveField(0)
  final String productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int weight;

  @HiveField(4)
  int count;

  @HiveField(5)
  final double price;

  CartItemModel({
    required this.image,
    required this.weight,
    required this.title,
    required this.productId,
    this.count = 1,
    required this.price,
  });

  // Methods to increment or decrement product count
  void incrementProduct() {
    count++;
  }

  void decrementProduct() {
    if (count > 1) {
      count--;
    }
  }

  double get totalPrice => price * count;

  // Factory constructor to create CartItemModel from ProductModel
  factory CartItemModel.fromProductModel(ProductModel product) {
    return CartItemModel(
      productId: product.id.toString(),
      title: product.title,
      image: product.thumbnail ?? '',  // Use thumbnail or a default image
      weight: product.weight ?? 0,
      price: product.price,
    );
  }
}
