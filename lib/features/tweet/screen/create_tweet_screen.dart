import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/custom_button.dart';
import 'package:twitter_clone/common/loading_page.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/theme/theme.dart';

class CreateTweetScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const CreateTweetScreen());
  const CreateTweetScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetScreenState();
}

class _CreateTweetScreenState extends ConsumerState<CreateTweetScreen> {
  @override
  Widget build(BuildContext context) {
    final currenUser = ref.watch(currentUserDetailsProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
        actions: [
          CustomButton(
              onTap: () {},
              label: 'Post',
              backgroundColor: Pallete.blueColor,
              textColor: Pallete.whiteColor)
        ],
      ),
      body: currenUser == null
          ? const Loader()
          : SafeArea(
              child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Pallete.blueColor,
                      backgroundImage: NetworkImage(currenUser.profilePic),
                    )
                  ],
                )
              ]),
            )),
    );
  }
}
