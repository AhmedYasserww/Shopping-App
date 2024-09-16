import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/add_to_faviorite.dart';
import '../../../../data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.maxLineOfDesc = 1,
    this.heightOfImage = 120,
    required this.productModel,
  });

  final int maxLineOfDesc;
  final double heightOfImage;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kProductDetailsView, extra: productModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          color: Colors.grey[200],
          width: 200.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: 200.w,
                      height: heightOfImage,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productModel.thumbnail ?? ''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 2,
                      right: 2,
                      child: AddToFavoriteWidget(favoriteModel: productModel,),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productModel.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:  Styles.textStyle18,
              ),
              const SizedBox(height: 5),
              Opacity(
                opacity: .4,
                child: Text(
                  productModel.description ?? '',
                  maxLines: maxLineOfDesc,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
