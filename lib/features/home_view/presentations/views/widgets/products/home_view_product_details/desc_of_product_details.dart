import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/product_details_tile.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/bottom_add_to_cart.dart';

class DescOfProductDetails extends StatelessWidget {
const DescOfProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(15.0),
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
                     "25 Є",
                     style:  Styles.textStyle20.copyWith(color: Colors.blue)
                 ),
               ],
             ),
             const SizedBox(height: 8),
            Text(
              "t_shirt sss aa",
              style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 16),
            const ProductDetailsTile(
              title: 'description',
              description: "zz xx ccccs i want to go to the scool aa xx cddvf "
            ),
             const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "category : ",
                  style:Styles.textStyle24.copyWith(fontWeight: FontWeight.w600,),
                  // Example usage
                ),
                Text("brant zare",style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500,))
              ],
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Text(
                  "brand : ",
                  style:Styles.textStyle24.copyWith(fontWeight: FontWeight.w600)  ,
                  // Example usage
                ),
                Text("brant zare",style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
             SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 150,
                  child: Image.network("https://assets.dummyjson.com/public/qr-code.png")),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Comment ",
                  style:Styles.textStyle24.copyWith(fontWeight: FontWeight.w600)  ,
                  // Example usage
                ),
                Text("brant zare",style:  Styles.textStyle20.copyWith(fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(height: 20,),
            BottomAddToCart(),
          ],
        ),
      ),
    );
  }
}
