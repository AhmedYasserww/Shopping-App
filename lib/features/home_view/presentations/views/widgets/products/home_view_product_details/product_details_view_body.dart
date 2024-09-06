import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/complete_product_details.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
   // print('Product Model: ${productModel.toJson()}'); // Debugging line

    return Scaffold(
      body: CompleteProductDetails(productModel: productModel),
    );
  }
}