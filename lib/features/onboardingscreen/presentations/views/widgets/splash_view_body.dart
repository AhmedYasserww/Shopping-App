import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/onboardingscreen/presentations/views/widgets/sliding_text.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}
class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation <Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();

  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds:7),(){
     GoRouter.of(context).push(AppRouter.kLogin);
    });
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,//بيسنتر العرض بتاع الايميج
      children: [
        const SizedBox(height: 130,),
        Center(
          child: SizedBox(
            width: 380, height: 400,
            child:Lottie.asset("assets/Animation - 1725927379937.json",fit: BoxFit.fill) ,),
        ),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(vsync:this,duration:const Duration(seconds: 4));
    slidingAnimation = Tween<Offset>(begin:const Offset(0,9) , end:const Offset(0,1)).animate(animationController);
    super.initState();
    animationController.forward();
  }
}
