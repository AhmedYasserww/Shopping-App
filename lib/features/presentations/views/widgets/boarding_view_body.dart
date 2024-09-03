import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/features/presentations/views/widgets/custom_indicator.dart';
import 'package:shoping_app/features/presentations/views/widgets/next_button.dart';

import '../../../../core/utils/styles.dart';
import '../../../data/models/onboarding_model.dart';
class BoardingViewBody extends StatefulWidget {
  const BoardingViewBody({super.key});

  @override
  State<BoardingViewBody> createState() => _HomeViewState();
}

class _HomeViewState extends State<BoardingViewBody> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h, right: 8.w),
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: (){},
              child: Text(
                'Skip',
                style: Styles.textStyle14.copyWith(color: Color(0xff6B778D)),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: SizedBox(
            width: 350.w,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: content.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Image(image: AssetImage(content[i].image))),
                    SizedBox(height: 24.h),
                    FittedBox(
                      child: Text(
                        content[i].title,
                        style: Styles.textStyle24.copyWith(color:const Color(0xff17223B)),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 120.h,
                      child: Text(
                        content[i].desc,
                        style: Styles.textStyle14
                            .copyWith(color: const Color(0xff263859).withOpacity(.6)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomIndicator(
          currentIndex: currentIndex,
          length: content.length,
          width: 15,
          height: 15,
        ),
        SizedBox(height: 24.h),
        NextButton(onPressed: (){}),
        SizedBox(
          height: 32)
      ],
    );
  }


// void onNextButtonPressed() {
//     if (currentIndex == content.length - 1) {
//       GoRouter.of(context).push(AppRouter.kLogin);
//     } else {
//       controller.nextPage(
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.bounceIn,
//       );
//     }
//   }
}

