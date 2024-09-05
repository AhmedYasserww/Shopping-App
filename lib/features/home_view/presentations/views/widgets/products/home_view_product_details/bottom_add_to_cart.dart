import 'package:flutter/material.dart';

import '../../../../../../../core/utils/styles.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child:  Center(
                  child: Text(
                    "+ Add To Cart",
                    style: Styles.textStyle20,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}

//   void _messageAlret(String title, String text) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title, style: const TextStyle(fontSize: 30)),
//           content: Text(text, style: const TextStyle(fontSize: 20)),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
