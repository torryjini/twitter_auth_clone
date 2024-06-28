import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/auth/widgets/form_button.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/onboarding/interests_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isFilled = false;
  bool _isShowing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPassword() {
    if (_controller.text.length >= 8 && _controller.text.isNotEmpty) {
      setState(() {
        _isFilled = true;
      });
    } else {
      setState(() {
        _isFilled = false;
      });
    }
  }

  void _onShowingTap() {
    setState(() {
      _isShowing = !_isShowing;
    });
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
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
                "You'll need a password",
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Gaps.v16,
              Text(
                "Make sure it's 8 characters or more.",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v24,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: _controller,
                    enabled: true,
                    obscureText: !_isShowing,
                    onChanged: (value) {
                      _onPassword();
                    },
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedOpacity(
                              opacity: _isFilled ? 1 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: Sizes.size20,
                              ),
                            ),
                            Gaps.h10,
                            GestureDetector(
                              onTap: _onShowingTap,
                              child: FaIcon(
                                _isShowing
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: Colors.grey.shade500,
                                size: Sizes.size16,
                              ),
                            ),
                          ],
                        ),
                        labelText: "Password"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
