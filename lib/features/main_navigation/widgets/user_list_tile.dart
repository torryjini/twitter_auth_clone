import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/follow_button.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/thumbnail.dart';

class UserListTile extends ConsumerWidget {
  final String userId;
  final String desc;
  final String followers;

  const UserListTile({
    super.key,
    required this.userId,
    required this.desc,
    required this.followers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.size12,
        top: Sizes.size10,
        bottom: Sizes.size6,
        right: 0,
      ),
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: Sizes.size7,
              ),
              child: Thumbnail(thumb: 'https://picsum.photos/200'),
            ),
            Gaps.h16,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: Sizes.size10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              userId,
                              style: TextStyle(
                                color:
                                    ref.watch(darkModeConfigProvider).darkMode
                                        ? Colors.grey.shade200
                                        : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.h8,
                            const FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              size: Sizes.size16,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        Text(
                          desc,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v12,
                        Text(
                          "$followers followers",
                          style: TextStyle(
                            color: ref.watch(darkModeConfigProvider).darkMode
                                ? Colors.grey.shade200
                                : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      ],
                    ),
                    const FollowButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
