import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: Sizes.size8, horizontal: Sizes.size12),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size20,
        vertical: Sizes.size4,
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(Sizes.size12),
      ),
      child: const Text(
        "Follow",
        style: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
