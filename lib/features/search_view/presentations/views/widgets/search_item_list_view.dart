import 'package:flutter/material.dart';
import 'package:shoping_app/features/search_view/presentations/views/widgets/sarch_item.dart';
class SearchItemListView extends StatelessWidget {
  const SearchItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context,i){
          return const SearchItem();
        });
  }
}
