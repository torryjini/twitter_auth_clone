import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/activity_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/home_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/search_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/create_post.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/user_profile_screen.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/";

  const MainNavigationScreen({
    super.key,
  });

  @override
  MainNavigationScreenState createState() => MainNavigationScreenState();
}

class MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCreatePostTap(BuildContext context) async {
    await showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.7,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const CreatePost(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const Center(
              child: Text(
                "Make new Post",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const UserProfileScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: ref.watch(darkModeConfigProvider).darkMode
            ? Colors.grey.shade900
            : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              isSelected: _selectedIndex == 0,
              icon: FontAwesomeIcons.house,
              onTap: () => _onTap(0),
            ),
            NavTab(
              isSelected: _selectedIndex == 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => _onTap(1),
            ),
            NavTab(
              isSelected: _selectedIndex == 2,
              icon: FontAwesomeIcons.penToSquare,
              onTap: () => _onCreatePostTap(context),
            ),
            NavTab(
              isSelected: _selectedIndex == 3,
              icon: FontAwesomeIcons.heart,
              onTap: () => _onTap(3),
            ),
            NavTab(
              isSelected: _selectedIndex == 4,
              icon: FontAwesomeIcons.user,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
