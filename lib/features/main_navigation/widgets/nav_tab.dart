import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';

class NavTab extends ConsumerWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Center(
          child: Container(
            color: Colors.transparent,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: isSelected ? 1 : 0.4,
              child: FaIcon(
                icon,
                color: ref.watch(darkModeConfigProvider).darkMode
                    ? Colors.white
                    : Colors.black,
                size: Sizes.size24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
