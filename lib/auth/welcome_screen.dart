import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size36,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gaps.v96,
            Text(
              "Welcome to Twitter!",
              style: TextStyle(
                fontSize: Sizes.size60,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v96,
          ],
        ),
      ),
    );
  }
}
