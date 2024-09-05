import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/products/home_view_product_details/image_stack_widget.dart';
import 'desc_of_product_details.dart';

class CompleteProductDetails extends StatefulWidget {
  const CompleteProductDetails({super.key});

  @override
  State<CompleteProductDetails> createState() => _CompleteProductDetailsState();
}

class _CompleteProductDetailsState extends State<CompleteProductDetails> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    'https://via.placeholder.com/400',
    'https://via.placeholder.com/400',
    'https://via.placeholder.com/400',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final pageIndex = _pageController.page?.round() ?? 0;
      if (_currentIndex != pageIndex) {
        setState(() {
          _currentIndex = pageIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return Column(
      children: [
        ImageStackWidget(
          pageController: _pageController,
          images: images,
        ),
        Expanded(
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const DescOfProductDetails(), // Product details section
          ),
        ),
      ],
    );
  }
}

