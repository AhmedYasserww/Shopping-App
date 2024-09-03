import 'package:flutter/material.dart';
import 'package:shoping_app/features/presentations/views/widgets/boarding_view_body.dart';
class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: BoardingViewBody()),
    );
  }
}
