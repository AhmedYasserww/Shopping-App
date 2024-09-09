import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/cart_item_model.dart';
import '../../manager/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CartItem extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartItem({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4),
      child: Container(
        color: Colors.grey[100],
        child: Row(
          children: [
            SizedBox(
             // height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  fit: BoxFit.fill,
                  cartItemModel.image,
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
                  const SizedBox(height: 8,),
                  Text(
                    cartItemModel.title,
                    style: GoogleFonts.gabarito(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '${cartItemModel.price}\$',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.gabarito(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          context
                              .read<AddProductToCartCubit>()
                              .decrementProduct(cartItemModel.title);
                        },
                      ),
                      Text(
                        cartItemModel.count.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context
                              .read<AddProductToCartCubit>()
                              .incrementProduct(cartItemModel.title);
                        },
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  BlocProvider.of<AddProductToCartCubit>(context).removeFromCart(cartItemModel.title);
                },
                  icon: const Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.blue,
                    size: 24.0,
                  ),),
               const  SizedBox(height: 16,),
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
                      "Weight",
                      style:  TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 35,
                    width: 45,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        cartItemModel.weight.toString(),
                        style: GoogleFonts.gabarito(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),

          ],
        ),
      ),
    );
  }
}
