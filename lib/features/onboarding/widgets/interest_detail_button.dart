import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class InterestDetailButton extends StatefulWidget {
  const InterestDetailButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestDetailButton> createState() => _InterestDetailButtonState();
}

class _InterestDetailButtonState extends State<InterestDetailButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size12,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size32,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
