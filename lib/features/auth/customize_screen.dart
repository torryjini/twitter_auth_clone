import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/auth/confirm_screen.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class CustomizeScreen extends StatefulWidget {
  final Map<String, String> formData;
  const CustomizeScreen({
    super.key,
    required this.formData,
  });

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  bool isAgreed = false;

  bool isSwitched() {
    isAgreed = !isAgreed;
    setState(() {});
    return isAgreed;
  }

  void onNextTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmScreen(
          formData: widget.formData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size36,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v28,
                  const Text(
                    "Customize your experience",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Track where you see Twitter content across the web",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      const Flexible(
                        flex: 4,
                        child: Text(
                          "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                          maxLines: 7,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Switch(
                          value: isAgreed,
                          onChanged: (value) {
                            isSwitched();
                          },
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v24,
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.grey),
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
                          text:
                              ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. ",
                        ),
                        TextSpan(
                          text: "Learn more",
                          style: TextStyle(
                            color: Colors.blue.shade400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: isAgreed
                    ? () {
                        onNextTap(context);
                      }
                    : null,
                child: Container(
                    margin: const EdgeInsets.only(
                      bottom: Sizes.size20,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.95,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: isAgreed ? Colors.black : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: TextStyle(
                                fontSize: Sizes.size20,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
