import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final bool isReady;

  const FormButton({
    super.key,
    required this.text,
    required this.isReady,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: isReady ? Colors.black : Colors.grey.shade600,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w900,
                color: isReady ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
