import 'package:flutter/material.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_button_details.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_email_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_log_in_navigation.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_password_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_phone_number_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/cutom_name_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = true;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const CustomAppBar(
      //   title: "Register",
      // ),
      body: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                SizedBox(
                    height: 160,
                    width: 286,
                    child:
                        Image(image: AssetImage("assets/images/register.jpg"))),
                SizedBox(
                  height: 21,
                ),
                NameField(nameController: nameController),
                SizedBox(
                  height: 21,
                ),
                PhoneNumberField(nameController: phoneNumberController),
                SizedBox(
                  height: 21,
                ),
                EmailField(emailController: emailController),
                const SizedBox(height: 21),
                PasswordField(
                  passwordController: passwordController,
                  visible: visible,
                  toggleVisibility: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                const SizedBox(height: 21),
                CustomButtonDetails(
                  onTap: () {},
                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Register",
                  /* onTap: () async {
                    if (globalKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Verification email sent! Please check your inbox.'),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Registration failed: ${e.toString()}'),
                          ),
                        );
                      }
                    }
                  },*/
                ),

                const LoginNavigation(),
                TextButton(
                  onPressed: () {},
                  /* onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password reset email sent! Please check your inbox.'),
                        ),
                      );
                    } catch (e) {
                      // Handle errors, such as invalid email
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${e.toString()}'),
                        ),
                      );
                    }
                  },*/
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 22),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
