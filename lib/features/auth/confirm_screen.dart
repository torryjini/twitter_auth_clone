import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/auth/verify_screen.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class ConfirmScreen extends StatefulWidget {
  final Map<String, String> formData;
  const ConfirmScreen({
    super.key,
    required this.formData,
  });

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSignUpTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VerifyScreen(
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v24,
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.size32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v24,
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.formData["name"],
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Name",
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Gaps.v16,
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.formData["email"],
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Email address",
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Gaps.v16,
                    TextFormField(
                      readOnly: true,
                      initialValue: widget.formData["birthday"],
                      style: TextStyle(
                        color: Colors.blue.shade400,
                      ),
                      decoration: const InputDecoration(
                        labelText: "Date of birth",
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: Sizes.size24,
                ),
                child: Column(
                  children: [
                    Text.rich(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: Sizes.size14,
                      ),
                      TextSpan(
                        text: "By signing up, you agree to the ",
                        children: [
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          const TextSpan(
                            text: " and ",
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          const TextSpan(
                            text: ", including ",
                          ),
                          TextSpan(
                            text: "Cookie Use",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ". Twitter may use your contact information, including your outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
                          ),
                          TextSpan(
                            text: "Learn more",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
                          ),
                          TextSpan(
                            text: "here",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                          const TextSpan(text: ".")
                        ],
                      ),
                    ),
                    Gaps.v24,
                    GestureDetector(
                      onTap: () {
                        _onSignUpTap(context);
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.95,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign up",
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
