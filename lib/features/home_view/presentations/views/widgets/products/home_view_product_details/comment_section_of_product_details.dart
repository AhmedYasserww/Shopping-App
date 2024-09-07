import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';
class CommentsSectionOfProductDetails extends StatelessWidget {
  final ProductModel productModel;

  const CommentsSectionOfProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Comments : ",
          style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
        ),
        if (productModel.reviews != null && productModel.reviews!.isNotEmpty)

          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productModel.reviews!.length,
              itemBuilder: (context, index) {
                final review = productModel.reviews![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    review.comment ?? "No Comment",
                    style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
                    //   maxLines: 2,

                  ),
                );
              },
            ),
          )
        else
          const Text("No comments available"),
      ],
    );
  }
}