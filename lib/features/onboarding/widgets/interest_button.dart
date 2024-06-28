import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.isSelectable,
    required this.onSelected,
    required this.isContained,
  });

  final String interest;
  final bool isSelectable;
  final bool isContained;
  final void Function()? onSelected;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.46,
      child: GestureDetector(
        onTap: widget.isSelectable ? widget.onSelected : null,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 300,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Sizes.size10,
            ),
            border: Border.all(
                color:
                    widget.isContained ? Colors.blue.shade600 : Colors.grey.shade400),
            color: widget.isContained ? Colors.blue.shade600 : Colors.transparent,
          ),
          height: Sizes.size72,
          padding: const EdgeInsets.all(
            Sizes.size8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: Sizes.size20,
                    color: widget.isContained ? Colors.white : Colors.transparent,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.interest,
                    style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                        color: widget.isContained ? Colors.white : Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
