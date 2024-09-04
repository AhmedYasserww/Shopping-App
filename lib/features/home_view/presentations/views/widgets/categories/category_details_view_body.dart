import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item.dart';
class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: .68,
        ),
        itemBuilder: (context, i) {
          return  const ProductItem(
            maxLineOfDesc: 2,
            heightOfImage: 160,
          );
        },

      ),
    );
  }
}