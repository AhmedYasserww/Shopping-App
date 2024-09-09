import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/styles.dart';
import 'package:shoping_app/features/auth/presentations/views/register_view.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_button_details.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_email_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_password_text_field.dart';

import '../../../../core/utils/app_router.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visible = true;
  String? userToken;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
   // getToken();
    super.initState();

  }
  // getToken() async {
  //  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //userToken = prefs.getString('userToken');
  //   print("**********");
  //   log(userToken.toString());
  //   print("*********");
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // appBar:AppBar(title:Text("login"),),
      body: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height:60,),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 184,
                    width: 286,
                    child: Image(image: AssetImage("assets/images/log_in.jpg"))),
                SizedBox(height: 21,),

                EmailField(emailController: emailController),
                const SizedBox(height: 30,),
                PasswordField(passwordController: passwordController,
                  visible: visible,
                  toggleVisibility: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                const SizedBox(height: 30,),
                CustomButtonDetails(
                  onTap: () async {
                    if (globalKey.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        User? user = userCredential.user;
                        if (user != null) {
                          if (!user.emailVerified) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Email not verified. Please check your email for verification.'),
                                action: SnackBarAction(
                                  label: 'Resend Verification',
                                  onPressed: () async {
                                    await user.sendEmailVerification();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Verification email resent!'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Log in successful'),
                              ),
                            );

                             GoRouter.of(context).push(AppRouter.kNavigationBar);
                          }
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed: ${e.toString()}'),
                          ),
                        );
                      }
                    }
                  },

                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Log In",
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: const Text(
                        "Don't have an account ?",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>const RegisterScreen()),);
                        },
                        child:  Text(
                          "Register",
                          style:Styles.textStyle20.copyWith(color: Colors.blue)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
