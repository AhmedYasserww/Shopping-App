import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoping_app/features/home_view/data/models/ProductModel.dart';

import '../../../../../core/utils/styles.dart';
class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.productModel});
final ProductModel productModel ;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
           productModel.thumbnail??" ",
            width: 80.0,
            height: 80.0,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
            productModel.title,
            style:Styles.textStyle16.copyWith( fontFamily: GoogleFonts.gabarito().fontFamily,fontWeight: FontWeight.bold,)

        ),
        subtitle: Text(
          productModel.description?? " ",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:Styles.textStyle14.copyWith(fontFamily:GoogleFonts.gabarito().fontFamily, color: Colors.black54,)

        ),
        onTap: () {
          print("ahmed");
        },
      ),
    );
  }
}
