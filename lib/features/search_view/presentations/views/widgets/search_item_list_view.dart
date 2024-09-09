import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/core/utils/widgets/custom_empty_screen.dart';
import 'package:shoping_app/core/utils/widgets/custom_error_widget.dart';
import 'package:shoping_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:shoping_app/features/search_view/presentations/manager/search_for_product_cubit/search_for_product_cubit.dart';
import 'package:shoping_app/features/search_view/presentations/views/widgets/sarch_item.dart';
class SearchItemListView extends StatelessWidget {
  const SearchItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchForProductCubit,SearchForProductState>(
      builder: (context,state) {
        if(state is SearchForProductLoading){
          return const CustomLoadingIndicator();
        }
        else if(state is SearchForProductSuccess){
          if(state.product.isEmpty){
            return const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 46),
              child:  CustomEmptyScreen(message:"No results found. Please modify your search and try again.",),
            );
          }
          return ListView.builder(
              itemCount: state.product.length,
              itemBuilder: (context,i){
                return  SearchItem(productModel:state.product[i]);
              });
        }
        else if(state is SearchForProductFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else{
          return const CustomEmptyScreen(message: "Search For Products...");
        }


      }
    );
  }
}
