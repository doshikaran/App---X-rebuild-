import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_button.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../../auth/controller/auth_controller.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetScreen(),
      );
  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.cancel), onPressed: () {}),
        actions: [
          CustomButton(
              onTap: () {},
              label: 'Post',
              backgroundColor: Pallete.blueColor,
              textColor: Pallete.whiteColor)
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(currentUser.profilePic),
                          radius: 30,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
