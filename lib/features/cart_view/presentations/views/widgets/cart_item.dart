import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/core/utils/styles.dart';

class CartItem extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const CartItem({
    required this.onRemove,
    required this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 110.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                fit: BoxFit.fill,
                "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png",
                width: width * 0.3,
                height: width * 0.3,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title: T-shirt over size shorts (white / 2xl)",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.gabarito(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'price 19.6\u{20AC} ',
                  style: GoogleFonts.gabarito(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: onRemove,
                    ),
                    const Text(
                      '8',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: onAdd,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                height: 35,
                width: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xFFD8F2E5),
                ),
                child: const Center(
                  child: Text(
                    "weight",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF08A455),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey,
                    width: 2
                  ),

                ),
                child:  Text("8",style:Styles.textStyle18,),
              ),
            ],
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
