import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/home_view/presentations/manager/featch_all_categories/fetch_all_categories_cubit.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/categories/category_item.dart';
class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kCategoryDetailsView);
      },
      child: BlocBuilder<FetchAllCategoriesCubit,List<String>>(
        builder: (context,categories){
          if(categories.isEmpty){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return  SizedBox(
          height: 70,
          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, i) {
          return CategoryItem(category: categories[i],);
          }),
          );
          }
        }

      ),
    );
  }
}