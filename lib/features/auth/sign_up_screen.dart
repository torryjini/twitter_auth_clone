import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_auth_clone/features/auth/create_account_screen.dart';
import 'package:twitter_auth_clone/features/auth/login_screen.dart';
import 'package:twitter_auth_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_auth_clone/features/auth/widgets/sns_auth_button.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    context.go("/login");
  }

  void _onCreateAccount(BuildContext context) {
    context.push("/createaccount");
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size48),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                "See what's happening in the world right now.",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              Gaps.v80,
              const SnsAuthButton(
                icon: FontAwesomeIcons.google,
                text: "Continue with Google",
              ),
              Gaps.v10,
              const SnsAuthButton(
                icon: FontAwesomeIcons.apple,
                text: "Continue with Apple",
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
              GestureDetector(
                onTap: () => _onCreateAccount(context),
                child: const FormButton(
                  text: "Create account",
                  isReady: true,
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
                    Gaps.v24,
                    Row(
                      children: [
                        Text(
                          "Have an account already? ",
                          style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey.shade300
                                : Colors.grey.shade700,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _onLoginTap(context),
                          child: Text(
                            "Log in",
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
      ),
    );
  }
}
