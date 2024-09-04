
import 'package:flutter/material.dart';
class CustomButtonDetails extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String text;
  final void Function()? onTap;

  const CustomButtonDetails({
    super.key,
    required this.globalKey,
    required this.emailController,
    required this.passwordController,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 50,
        width: double.infinity,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
/*
() async{
        if (globalKey.currentState!.validate()) {
          print(emailController.text);
          print(passwordController.text);
        //  print('Validation passed');
        /*  ApiService().userLogin(
            userName: emailController.text,
            password: passwordController.text,
          )
              .then((onValue) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(onValue.toString())),
            );
          });*/
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email:emailController.text ,
              password: passwordController.text
          ) .then((onValue) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("logIn Success"),
            )
            );
            print(onValue.user!.email);
            print(onValue.user!.emailVerified);
            print(onValue.user!.uid);


          }).catchError((onError){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("logIn Failed"),
                ));
            print(onError.toString());
             });
          }
      },
 */