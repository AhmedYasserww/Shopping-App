import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/widgets/add_to_faviorite.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,this.maxLineOfDesc=1, this.heightOfImage=135});
final int maxLineOfDesc ;
final double heightOfImage ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    width: 300,
                  height: heightOfImage,
                    //width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://en.sergeblanco.com/phototheque/sergeblanco.com/21750/large/01W021578B.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 2,
                    right: 2,
                    child: AddToFavoriteWidget(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            overflow: TextOverflow.ellipsis,
            "t_shirt organic T-shirt sss aaa accc aa ",
            maxLines: 2,

            style:  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Opacity(
            opacity: .4,
            child: Text(
             "aaaaaaaaaaaa vvv qqq eee vvvv zzz ",
              maxLines: maxLineOfDesc, // Limit number of lines
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
