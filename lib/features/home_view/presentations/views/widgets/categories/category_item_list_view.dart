import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/categories/category_item.dart';
class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kCategoryDetailsView);
      },
      child: SizedBox(
        height: 70,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, i) {
              return CategoryItem();
            }),
      ),
    );
  }
}