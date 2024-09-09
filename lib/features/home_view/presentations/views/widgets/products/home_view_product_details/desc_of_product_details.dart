import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/product_details_tile.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/bottom_add_to_cart.dart';
import '../../../../../../cart_view/data/models/cart_item_model.dart';
import '../../../../../data/models/ProductModel.dart';
import 'comment_section_of_product_details.dart';

class DescOfProductDetails extends StatelessWidget {
  const DescOfProductDetails({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final cartItemModel = CartItemModel(
      weight: productModel.weight??0,
      productId: productModel.id.toString(),
      title: productModel.title,
      price: productModel.price,
      image: productModel.thumbnail??"",
      count: 1, // Initial quantity
    );

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productModel.title,
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Price : ",
                  style: Styles.textStyle24,
                ),
                Text(
    '${productModel.price.toString()}\$',
                  style: Styles.textStyle20.copyWith(color: Colors.blue),
                ),
              ],
            ),


            const SizedBox(height: 16),
            ProductDetailsTile(
              title: 'Description',
              description: productModel.description ?? " ",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Category: ",
                  style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  productModel.category ?? " ",
                  style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Brand: ",
                  style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  productModel.brand ?? " ",
                  style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("QR Code : ",style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),

            Center(
              child: SizedBox(
                height: 150,
                child: productModel.meta != null
                    ? Image.network(productModel.meta!.qrCode.toString())
                    : const Center(child: Text("QR Code not available")),
              ),
            ),
            const SizedBox(height: 20),
            CommentsSectionOfProductDetails(productModel: productModel),
            BottomAddToCart(cartItemModel: cartItemModel),
          ],
        ),
      ),
    );
  }
}
