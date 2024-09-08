import 'package:hive/hive.dart';
part 'product_faviorite_model.g.dart';
@HiveType(typeId: 0)
class ProductFavoriteModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content ;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final int productId;


  ProductFavoriteModel({required this.productId, required this.title, required this.content, required this.image, required this.price});
}