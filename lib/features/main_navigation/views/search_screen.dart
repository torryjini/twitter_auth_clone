import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/user_list_tile.dart';
import 'package:twitter_auth_clone/models/user_profile_model.dart';

final users = [
  UserProfileModel(
    userId: "rjmithun",
    desc: "Mithun",
    followers: "26.6K",
  ),
  UserProfileModel(
    userId: "vicenews",
    desc: "VICE News",
    followers: "301K",
  ),
  UserProfileModel(
    userId: "trevornoah",
    desc: "Trevor Noah",
    followers: "789K",
  ),
  UserProfileModel(
    userId: "condenasttraveller",
    desc: "Conde Nast Traveller",
    followers: "130K",
  ),
  UserProfileModel(
    userId: "chef_pillai",
    desc: "Suresh Pillai",
    followers: "69.2K",
  ),
  UserProfileModel(
    userId: "malala",
    desc: "Malala Yousafzai",
    followers: "237K",
  ),
  UserProfileModel(
    userId: "sebin_cyriac",
    desc: "Fishing_freaks",
    followers: "53.2K",
  ),
];

class SearchScreen extends StatelessWidget {
  static const routeUrl = "/search";

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: context.watch<DarkModeConfigVm>().darkMode
            ? Colors.grey.shade200
            : Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 12,
            top: 20,
            bottom: 16,
          ),
          child: Text(
            "Search",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size28,
            ),
          ),
        ),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: CupertinoSearchTextField(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var user in users)
              UserListTile(
                userId: user.userId,
                desc: user.desc,
                followers: user.followers,
              )
          ],
        ),
      ),
    );
  }
}
