import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_text_form_field_widget.dart';
import 'package:shoping_app/features/search_view/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'package:shoping_app/features/search_view/presentations/views/widgets/search_item_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 6.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomTextField(
                  onChange: (value) {
                    BlocProvider.of<SearchForProductCubit>(context).searchForProduct(value.toString());
                  //  context.read<SearchForProductCubit>().searchForProduct(value.toString());
                  },
                  controller: searchController,
                  filled: true,
                  fillColor: const Color(0xFFEEEEEE),
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
                      searchController.clear();
                    //  context.read<SearchForProductCubit>().searchForProduct('');
                      BlocProvider.of<SearchForProductCubit>(context).searchForProduct('');
                    },
                  ),
                ),
              ),
              const Expanded(child: SearchItemListView()),
            ],
          ),
        ),
      );

  }
}
