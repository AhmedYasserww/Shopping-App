import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/core/utils/widgets/custom_error_widget.dart';
import 'package:shoping_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:shoping_app/features/home_view/presentations/manager/fetch_top_products/fetch_top_products_cubit.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/product_item.dart';
class ProductItemListView extends StatelessWidget {
  const ProductItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTopProductsCubit,FetchTopProductsState>(
      builder: (context,state) {
        if(state is FetchTopProductSuccess){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.product.length,
              itemBuilder: (context,i){
                return ProductItem(productModel: state.product[i]);
              });
        }
        else if(state is FetchTopProductFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        else{
          return CustomLoadingIndicator();
        }

      }
    );
  }
}