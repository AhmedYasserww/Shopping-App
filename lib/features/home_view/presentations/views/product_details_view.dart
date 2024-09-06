import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/product_details_view_body.dart';
class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
final ProductModel productModel ;
  @override
  Widget build(BuildContext context) {
    return  ProductDetailsViewBody(productModel:productModel ,);
  }
}
