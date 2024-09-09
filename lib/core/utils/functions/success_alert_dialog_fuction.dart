import 'package:flutter/material.dart';
import 'package:shoping_app/core/utils/styles.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Success", style: Styles.textStyle20),
        content: Text("Item added to cart successfully.", style: Styles.textStyle18),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK', style: Styles.textStyle20),
          ),
        ],
      );
    },
  );
}
