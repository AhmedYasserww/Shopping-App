import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';

import '../../../../../../core/utils/styles.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,required this.category});
final String  category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: (){
            GoRouter.of(context).push(AppRouter.kCategoryDetailsView,extra: category);

          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 150.w,
            height: 50.h,
            child: FittedBox(
              fit: BoxFit.scaleDown,
                child: Text(category, style: Styles.textStyle20,)),
          ),
        ),
      ),
    );
  }}