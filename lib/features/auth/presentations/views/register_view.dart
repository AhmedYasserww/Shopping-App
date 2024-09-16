import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/core/utils/app_router.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_button_details.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_email_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_log_in_navigation.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_password_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/custom_phone_number_text_field.dart';
import 'package:shoping_app/features/auth/presentations/views/widgets/cutom_name_text_field.dart';

import '../../data/save_data.dart';

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
                const SizedBox(
                    height: 160,
                    width: 286,
                    child:
                        Image(image: AssetImage("assets/images/register.jpg"))),
                const SizedBox(
                  height: 21,
                ),
                NameField(nameController: nameController),
                const SizedBox(
                  height: 21,
                ),
                PhoneNumberField(nameController: phoneNumberController),
                const SizedBox(
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
                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Register",
                  onTap: () async {
                    await _handleRegistration();
                  },
                ),
                const LoginNavigation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRegistration() async {
    if (globalKey.currentState!.validate()) {
      try {
        await _saveUserData();
        await _registerUser();
      } catch (e) {
        _showSnackBar('Registration failed: ${e.toString()}');
      }
    }
  }

  Future<void> _saveUserData() async {
    log("###########################");
    log("Before saving data");
    await saveUserData(
      name: nameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      password: passwordController.text,
    );
    log("###########################");
    log("After saving data");

    Map<String, String?> userData = await getUserData();
    log("###########################");
    log("User data retrieved:");
    (userData['name']);
    print(userData['email']);
    (userData['phoneNumber']);
    print(userData['password']);
  }

  Future<void> _registerUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    log("User registered");

    User? user = userCredential.user;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      log("###########################");
      log("Verification email sent");
      _showSnackBar('Verification email sent! Please check your inbox.');
      GoRouter.of(context).push(AppRouter.kLogin);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
