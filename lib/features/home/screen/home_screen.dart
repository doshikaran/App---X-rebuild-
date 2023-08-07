import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter_clone/constants/assets_constants.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/tweet/screen/create_tweet_screen.dart';
import 'package:twitter_clone/theme/pallete.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final appbar = UIConstants.appBar();

  void onPageChange(int index) {
    setState(() {
      _page = index;
    });
  }

  // create tweet
  onCreateTweet() {
    Navigator.push(context, CreateTweetScreen.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: IndexedStack(
        index: _page,
        children: UIConstants.bottomTabBarPages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTweet,
        child: const Icon(
          Icons.add,
          color: Pallete.whiteColor,
          size: 24,
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Pallete.backgroundColor,
          currentIndex: _page,
          onTap: onPageChange,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
              _page == 0
                  ? AssetsConstants.homeFilledIcon
                  : AssetsConstants.homeOutlinedIcon,
              color: Pallete.whiteColor,
            )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
              _page == 1
                  ? AssetsConstants.searchIcon
                  : AssetsConstants.searchIcon,
              color: Pallete.whiteColor,
            )),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
              _page == 2
                  ? AssetsConstants.notifFilledIcon
                  : AssetsConstants.notifOutlinedIcon,
              color: Pallete.whiteColor,
            ))
          ]),
    );
  }
}
