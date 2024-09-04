import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item.dart';
class ProductItemListView extends StatelessWidget {
  const ProductItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height:190,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context,i){
            return ProductItem();
          }),
    );
  }
}