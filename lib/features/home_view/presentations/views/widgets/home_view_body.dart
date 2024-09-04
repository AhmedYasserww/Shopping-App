import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/categories/category_item_list_view.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item_list_view.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Shopping App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
             SizedBox(
               width: double.infinity,
               height: 180,
                 child:   Image(image: NetworkImage("https://t4.ftcdn.net/jpg/00/63/83/29/360_F_63832907_SA64nRfoIU8qaPKDkcYT7Ax2T0eVFJDY.jpg"))),
            const SizedBox(height: 20,),
            Text("Shop By Category",style:Styles.textStyle24,),
            const SizedBox(height: 20,),
           const CategoryItemListView(),
            const SizedBox(height: 20,),
            Text("New Products",style:Styles.textStyle24,),
            SizedBox(height: 20,),
            Expanded(child: ProductItemListView()),
           // SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}




/*

 */

