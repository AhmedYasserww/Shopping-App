
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key,this.labelText,this.onSaved,this.onChange, this.validator, this.prefixIcon,this.suffixIcon,  this.obscureText =false, this.controller,this.filled,this.fillColor,this.hintText});

  final  String ? labelText;

   final void Function(String?)? onSaved;
   final void Function(String?)? onChange;
   final String? Function(String?)? validator;
   final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText ;
  final bool? filled;
  final TextEditingController? controller;
   final Color? fillColor;
   final String? hintText;
  @override
  Widget build(BuildContext context) {

      return TextFormField(
        controller: controller ,
        obscureText:obscureText,
        onSaved:onSaved ,
        onChanged: onChange,
        validator: validator,
          decoration:InputDecoration(
            fillColor:fillColor ,
              filled: filled,
            prefixIcon:prefixIcon ,
            prefixIconColor: Colors.blue,
            hintText:hintText ,
            suffixIcon: suffixIcon,
            labelText: labelText,
             labelStyle:const TextStyle(fontSize: 24,color: Color(0xff11D8EF)),

              hintStyle:const TextStyle(fontSize: 20),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
           focusedBorder: buildBorder(Colors.blue),
            errorBorder: buildBorder(Colors.red),
            focusedErrorBorder: buildBorder(Colors.red),
            border: const OutlineInputBorder()

          )
      );

  }
   OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white,width: 1.2),
    );
   }
}
