import 'package:flutter/material.dart';
import 'package:shoping_app/features/favorite_view/presentation/views/favoriteWidgets/favorite_item.dart';

class FavoriteItemListView extends StatelessWidget {
  const FavoriteItemListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount:20,
            itemBuilder: (context, i) {
              return const FavoriteItem();
            },
          );
  }
}
/*
 items.isEmpty
        ? Center(
            child: Text(
              'No items added yet!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          )
 */