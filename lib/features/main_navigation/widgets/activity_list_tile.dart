import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/follow_button.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/thumbnail.dart';

class ActivityListTile extends StatelessWidget {
  final String userId;
  final String time;
  final String desc;
  final bool follow;

  const ActivityListTile({
    super.key,
    required this.userId,
    required this.time,
    required this.desc,
    required this.follow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size16,
      ),
      child: ListTile(
        leading: Container(
            margin: const EdgeInsets.only(
              right: Sizes.size10,
            ),
            child: const Thumbnail(thumb: 'https://picsum.photos/200')),
        trailing: follow ? const FollowButton() : null,
        title: Row(
          children: [
            Text(
              userId,
              style: TextStyle(
                color: context.watch<DarkModeConfigVm>().darkMode
                    ? Colors.grey.shade200
                    : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h16,
            Text(
              time,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: Sizes.size18,
              ),
            ),
          ],
        ),
        subtitle: Text(
          desc,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: Sizes.size18,
          ),
        ),
      ),
    );
  }
}
