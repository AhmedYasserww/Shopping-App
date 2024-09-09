import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/core/utils/widgets/custom_error_widget.dart';
import 'package:shoping_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:shoping_app/features/home_view/presentations/manager/fetch_specific_product/fetch_specific_product_cubit.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/categories/category_details_bloc_builder.dart';

import '../../../../data/repo/home_repo_impl.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    final homeRepoImpl = GetIt.instance.get<HomeRepoImpl>();

    return BlocProvider(
      create: (context) => FetchSpecificProductCubit(homeRepoImpl, category)..fetchSpecificProduct(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: category != null
              ? Text(
                  category,
                  style: Styles.textStyle24,
                )
              : const Text('Category Details'),
        ),
        body: BlocBuilder<FetchSpecificProductCubit, FetchSpecificProductState>(
          builder: (context, state) {
            if (state is FetchSpecificProductSuccess) {
              return CategoryDetailsBlocBuilder(
                product: state.product,
              );
            } else if (state is FetchSpecificProductFailure) {
              return CustomErrorWidget(
                errorMessage: state.errorMessage,
              );
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
