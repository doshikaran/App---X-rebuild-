import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        'assets/svgs/twitter_logo2.svg',
        color: Colors.white,
        height: 25,
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    Text('Feed Screen'),
    Text('Search Screen'),
    Text('Notification Screen')
  ];
}
