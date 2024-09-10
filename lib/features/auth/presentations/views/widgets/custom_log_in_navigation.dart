import 'package:flutter/material.dart';
class LoginNavigation extends StatelessWidget {
  const LoginNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Are you have an account?",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child:  const Text(
            "LogIn",
            style: TextStyle(fontSize: 24,color: Colors.blue,fontWeight:FontWeight.bold ),
          ),
        ),
      ],
    );
  }
}
