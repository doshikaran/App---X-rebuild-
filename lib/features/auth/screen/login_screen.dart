import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_button.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/screen/signup_screen.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onlogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider.notifier).state;

    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      AuthField(
                        controller: emailController,
                        hintext: 'Email Address',
                      ),
                      const SizedBox(height: 25),
                      AuthField(
                        controller: passwordController,
                        hintext: 'Password',
                      ),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.topRight,
                        child: CustomButton(
                          onTap: onlogin,
                          label: 'Done',
                          backgroundColor: Pallete.whiteColor,
                          textColor: Pallete.backgroundColor,
                        ),
                      ),
                      const SizedBox(height: 25),
                      RichText(
                          text: TextSpan(
                              text: "Do not have an account?",
                              style: const TextStyle(fontSize: 14),
                              children: [
                            TextSpan(
                                text: ' Sign up',
                                style: const TextStyle(
                                    color: Pallete.blueColor, fontSize: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context, SignupScreen.route());
                                  })
                          ]))
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
