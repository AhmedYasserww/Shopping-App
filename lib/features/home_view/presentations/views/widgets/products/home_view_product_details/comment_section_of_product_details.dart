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
       const SizedBox(height: 8,),
        if (productModel.reviews != null && productModel.reviews!.isNotEmpty)

          SizedBox(
            height: 130,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productModel.reviews!.length,
              itemBuilder: (context, index) {
                final review = productModel.reviews![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    review.comment ?? "No Comment",
                    style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w500),
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