import 'package:flutter/material.dart';

class CustomAppbarForProductDetails extends StatelessWidget {
  const CustomAppbarForProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 50.0,right: 30,left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color:  Color(0xffD6DAD8),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
                color:  Color(0xffD6DAD8),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "cartView");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
