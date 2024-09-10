import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

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
      body: Form(
        key: globalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                SizedBox(
                    height: 184,
                    width: 286,
                    child: Image(image: AssetImage("assets/images/log_in.jpg"))),
                SizedBox(height: 21),
                EmailField(emailController: emailController),
                const SizedBox(height: 30),
                PasswordField(
                  passwordController: passwordController,
                  visible: visible,
                  toggleVisibility: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
                const SizedBox(height: 30),
                CustomButtonDetails(
                  onTap: () => _handleLogin(context),
                  globalKey: globalKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  text: "Log In",
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                   const Expanded(
                      flex: 2,
                      child: const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kRegister);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 22,color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      try {
        await _signInUser(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
          ),
        );
      }
    }
  }

  Future<void> _signInUser(BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    User? user = userCredential.user;
    if (user != null) {
      if (!user.emailVerified) {
        await _handleEmailNotVerified(user, context);
      } else {
        _showLoginSuccessMessage(context);
        GoRouter.of(context).push(AppRouter.kNavigationBar);
      }
    }
  }

  Future<void> _handleEmailNotVerified(User user, BuildContext context) async {
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
  }

  void _showLoginSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Log in successful'),
      ),
    );
  }
}
