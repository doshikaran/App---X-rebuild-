import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
// import 'package:twitter_clone/features/auth/screen/login_screen.dart';
import 'package:twitter_clone/features/auth/screen/signup_screen.dart';
import 'package:twitter_clone/features/home/screen/home_screen.dart';
import 'package:twitter_clone/theme/theme.dart';

import 'common/error_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeScreen();
              }
              return const SignupScreen();
            },
            error: (error, st) => ErrorPage(error: error.toString()),
            loading: () => const LoadingPage()));
  }
}
