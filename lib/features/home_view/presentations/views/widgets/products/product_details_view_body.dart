import 'package:flutter/material.dart';
import 'home_view_product_details/complete_product_details.dart';
class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: CompleteProductDetails(),
    );
  }
}
