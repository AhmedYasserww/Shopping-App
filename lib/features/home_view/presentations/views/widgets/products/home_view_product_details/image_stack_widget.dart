import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'custom_appbar_for_product_details.dart';
class ImageStackWidget extends StatelessWidget {
  final PageController pageController;
  final List<String> images;

  const ImageStackWidget({
    super.key,
    required this.pageController,
    required this.images,
  }) ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height * 0.4,
          child: PageView(
            controller: pageController,
            children: images
                .map((imageUrl) => Image.network(imageUrl, fit: BoxFit.fill))
                .toList(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                spacing: 16,
                expansionFactor: 4,
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
              ),
            ),
          ),
        ),
        const CustomAppbarForProductDetails(),
      ],
    );
  }
}

