import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/favorite_view/presentation/views/favoriteWidgets/favorite_item_list_view.dart';
class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.white54,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Text(
          "Your Favorites",
          style:Styles.textStyle24.copyWith(fontWeight: FontWeight.bold)
        ),
      ),
      body: const FavoriteItemListView()


    );
  }
}
