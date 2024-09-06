import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/product_details_tile.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/bottom_add_to_cart.dart';

import '../../../../../data/models/ProductModel.dart';
import 'comment_section_of_product_details.dart';

class DescOfProductDetails extends StatelessWidget {
const DescOfProductDetails({super.key, required this.productModel});
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Row(
               children: [
                 Text(
                  "Price : ",
                  style:  Styles.textStyle24
                             ),
                 Text(
                     productModel.price.toString(),
                     style:  Styles.textStyle20.copyWith(color: Colors.blue)
                 ),
               ],
             ),
             const SizedBox(height: 8),
            Text(
              productModel.title,
              style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 16),
             ProductDetailsTile(
              title: 'description',
              description: productModel.description??" "
            ),
             const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "category : ",
                  style:Styles.textStyle24.copyWith(fontWeight: FontWeight.w600,),
                  // Example usage
                ),
                Text(productModel.category??" ",style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500,))
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  "brand : ",
                  style:Styles.textStyle24.copyWith(fontWeight: FontWeight.w600)  ,
                  // Example usage
                ),
                Text(productModel.brand??" ",style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
             const SizedBox(height: 20),
            Center(
              child:  SizedBox(
                height: 150,
                child: productModel.meta != null
                    ? Image.network(productModel.meta!.qrCode.toString()) // Use ! since meta is checked for null
                    : const Center(child: Text("QR Code not available")),
              ),
            ),
            const SizedBox(height: 20),
            CommentsSectionOfProductDetails(productModel:productModel),
            const SizedBox(height: 20,),
            const BottomAddToCart(),
          ],
        ),
      ),
    );
  }
}

