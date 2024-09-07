import 'package:shoping_app/features/favorite_view/data/models/product_faviorite_model.dart';

import 'Dimensions.dart';
import 'Reviews.dart';
import 'Meta.dart';

class ProductModel extends ProductFavoriteModel{
  final int id;
  final String title;
  final String? description;
  final String? category;
  final double price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Reviews>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    this.description,
    this.category,
   required this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  }):super(image: thumbnail??" ",content:description?? " " ,title:title ,price:price ,productId :id);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price']?.toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      rating: json['rating']?.toDouble(),
      stock: json['stock'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List).map((v) => Reviews.fromJson(v)).toList()
          : [],
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions?.toJson(),
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews?.map((v) => v.toJson()).toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta?.toJson(),
      'images': images,
      'thumbnail': thumbnail,
    };
  }
}
