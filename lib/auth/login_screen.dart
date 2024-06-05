import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/auth/widgets/sns_auth_button.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size36,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Gaps.v96,
            const Text(
              "See what's happening in the world right now.",
              style: TextStyle(
                fontSize: Sizes.size36,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.v96,
            const SnsAuthButton(
              icon: FontAwesomeIcons.google,
              text: "Log in with Google",
            ),
            Gaps.v10,
            const SnsAuthButton(
              icon: FontAwesomeIcons.apple,
              text: "Log in with Apple",
            ),
            Gaps.v16,
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Sizes.size14,
                    ),
                    child: const Text(
                      "or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v4,
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gaps.v24,
            FractionallySizedBox(
              widthFactor: 0.95,
              child: Column(
                children: [
                  Text.rich(
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black,
                    ),
                    TextSpan(
                      text: "By signing up, you agree to our ",
                      children: [
                        TextSpan(
                          text: "Terms",
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                        const TextSpan(
                          text: ", ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                        const TextSpan(
                          text: ", and ",
                        ),
                        TextSpan(
                          text: "Cookie Use",
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                        const TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                  Gaps.v28,
                  Row(
                    children: [
                      Text(
                        "Create an account? ",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onSignUpTap(context),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.blue.shade400,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
