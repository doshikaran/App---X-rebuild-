import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_button.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/screen/login_screen.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/theme.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
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

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signup(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
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
                    onTap: onSignUp,
                    label: 'Done',
                    backgroundColor: Pallete.whiteColor,
                    textColor: Pallete.backgroundColor,
                  ),
                ),
                const SizedBox(height: 25),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(fontSize: 14),
                        children: [
                      TextSpan(
                          text: ' Log in',
                          style: const TextStyle(
                              color: Pallete.blueColor, fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginScreen.route());
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
