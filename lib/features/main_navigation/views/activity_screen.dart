import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/activity_list_tile.dart';
import 'package:twitter_auth_clone/models/activity_model.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Quotes",
  "Reposts",
  "Verified",
  "Shopping",
  "Brands",
];

final activities = [
  ActivityModel(
      userId: "john_mobbin",
      desc: "Starting out my gardening club with threads",
      time: "4h",
      follow: false),
  ActivityModel(
    userId: "the.plantdads",
    desc: "Followed you",
    time: "5h",
    follow: true,
  ),
  ActivityModel(
      userId: "the.plantdads",
      desc: "Definitely broken",
      time: "5h",
      follow: false),
  ActivityModel(
    userId: "theberryjungle",
    desc: "😎💕🐸",
    time: "5h",
    follow: false,
  ),
];

class ActivityScreen extends ConsumerWidget {
  static const routeUrl = "/activity";
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: ref.watch(darkModeConfigProvider).darkMode
              ? Colors.grey.shade200
              : Colors.black,
          title: const Text(
            "Activity",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size28,
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            labelPadding: EdgeInsets.zero,
            labelColor: ref.watch(darkModeConfigProvider).darkMode
                ? Colors.grey.shade200
                : Colors.black,
            dividerColor: Colors.transparent,
            unselectedLabelStyle: TextStyle(
              color: ref.watch(darkModeConfigProvider).darkMode
                  ? Colors.grey.shade200
                  : Colors.black,
            ),
            automaticIndicatorColorAdjustment: false,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: ref.watch(darkModeConfigProvider).darkMode
                ? Colors.grey.shade200
                : Colors.black,
            indicatorColor: Colors.transparent,
            tabs: [
              for (var tab in tabs)
                Container(
                  margin: const EdgeInsets.only(
                    right: Sizes.size6,
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size6, horizontal: Sizes.size24),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ref.watch(darkModeConfigProvider).darkMode
                          ? Colors.grey.shade200
                          : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(Sizes.size10),
                  ),
                  child: Text(
                    tab,
                    style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w600,
                        color: ref.watch(darkModeConfigProvider).darkMode
                            ? Colors.grey.shade200
                            : Colors.black),
                  ),
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Column(
                children: [
                  for (var activity in activities)
                    ActivityListTile(
                      userId: activity.userId,
                      time: activity.time,
                      desc: activity.desc,
                      follow: activity.follow,
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
