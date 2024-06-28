import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class FlashIcon extends StatelessWidget {
  final IconData icon;

  final bool onSelected;
  final void Function() onPressed;

  const FlashIcon({
    super.key,
    required this.icon,
    required this.onSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: onSelected ? Colors.amber.shade200 : Colors.white,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: Sizes.size32,
      ),
    );
  }
}
