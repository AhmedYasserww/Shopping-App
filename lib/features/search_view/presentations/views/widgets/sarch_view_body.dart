import 'package:flutter/material.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_text_form_field_widget.dart';
import 'package:shoping_app/features/search_view/presentations/views/widgets/search_item_list_view.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, bottom: 6.0),
        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child:  CustomTextField(
                    filled: true,
                    fillColor:const Color(0xFFEEEEEE) ,
                    hintText: 'Search for products...',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        //searchProvider.clearSearch();
                      },
                    ),
                  )
                ),
                const Expanded(child:  SearchItemListView())


              ],

        )

      ),
    );
  }
}

