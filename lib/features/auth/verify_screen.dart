import 'package:flutter/material.dart';
import 'package:flutter_verification_code_field/flutter_verification_code_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/auth/password_screen.dart';
import 'package:twitter_auth_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class VerifyScreen extends StatefulWidget {
  final Map<String, String> formData;
  const VerifyScreen({
    super.key,
    required this.formData,
  });

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool _isFilled = false;

  void _onCodeFilled(String value) {
    if (value.isNotEmpty && value.length == 4) {
      setState(() {
        _isFilled = true;
      });
    } else {
      setState(() {
        _isFilled = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v24,
              const Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v16,
              Text(
                "Enter it below to verify\n${widget.formData['email']}",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v24,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VerificationCodeField(
                    length: 4,
                    spaceBetween: Sizes.size12,
                    onFilled: (value) {
                      _onCodeFilled(value);
                    },
                  ),
                  Gaps.v28,
                  AnimatedOpacity(
                    opacity: _isFilled ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: Sizes.size32,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Sizes.size20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Didn't receive email?",
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v12,
            GestureDetector(
              onTap: _isFilled ? _onNextTap : () {},
              child: FormButton(
                text: "Next",
                isReady: _isFilled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
