import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/add_to_faviorite.dart';

import '../../../../data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,this.maxLineOfDesc=1, this.heightOfImage=135, required this.productModel});
final int maxLineOfDesc ;
final double heightOfImage ;
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 200,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    width: 300,
                  height: heightOfImage,
                    //width: double.infinity,
                    decoration:  BoxDecoration(
                     // color: Colors.grey,
                      image: DecorationImage(

                        image: NetworkImage(
                          productModel.thumbnail??" "
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 2,
                    right: 2,
                    child: AddToFavoriteWidget(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
           Text(
            overflow: TextOverflow.ellipsis,
            productModel.title,
            maxLines: 2,

            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Opacity(
            opacity: .4,
            child: Text(
             productModel.description??" ",
              maxLines: maxLineOfDesc, // Limit number of lines
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
