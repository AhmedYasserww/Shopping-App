import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item.dart';
class CategoryDetailsBlocBuilder extends StatelessWidget {
  const CategoryDetailsBlocBuilder({super.key,required this.product});
  final List<ProductModel>product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: GridView.builder(
        itemCount: product.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          childAspectRatio: .58,
        ),
        itemBuilder: (context, i) {
          return   ProductItem(
            productModel:product[i] ,
            maxLineOfDesc: 2,
            heightOfImage: 160,
          );
        },

      ),
    );
  }
}