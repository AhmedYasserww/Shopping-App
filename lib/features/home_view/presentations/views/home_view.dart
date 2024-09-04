import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/data/repo/home_repo_impl.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/home_view_body.dart';

import '../../data/repo/home_repo.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const HomeViewBody();
  }
}
