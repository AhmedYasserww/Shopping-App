
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key,required this.labelText,this.onSaved,this.onChange, this.validator, this.prefixIcon,this.suffixIcon,  this.obscureText =false, this.controller});

  final  String  labelText;

   final void Function(String?)? onSaved;
   final void Function(String?)? onChange;
   final String? Function(String?)? validator;
   final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText ;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {

      return TextFormField(
        controller: controller ,
        obscureText:obscureText,
        onSaved:onSaved ,
        onChanged: onChange,

        validator: validator,




          decoration:InputDecoration(

            prefixIcon:prefixIcon ,
            prefixIconColor: Colors.blue,

            suffixIcon: suffixIcon,
            labelText: labelText,
             labelStyle:const TextStyle(fontSize: 24,color: Color(0xff11D8EF)),

              hintStyle:const TextStyle(fontSize: 20),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
           focusedBorder: buildBorder(Colors.blue),
            errorBorder: buildBorder(Colors.red),
            focusedErrorBorder: buildBorder(Colors.red),
            border: const OutlineInputBorder()

          )
      );

  }
   OutlineInputBorder buildBorder([color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(color: color ?? Colors.white,width: 1.2),
    );
   }
}