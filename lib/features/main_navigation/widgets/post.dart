import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/three_dot_menu.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/thumbnail.dart';

class Post extends ConsumerWidget {
  final String userId;
  final String content;
  final int likes;
  final int comments;
  final List<String> images;
  final String thumb;

  const Post({
    super.key,
    required this.userId,
    required this.likes,
    required this.comments,
    required this.content,
    required this.images,
    required this.thumb,
  });

  void _onThreeDotTap(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.6,
      context: context,
      builder: (context) => const ThreeDotMenu(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size6, vertical: Sizes.size18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: Sizes.size12),
                child: Thumbnail(thumb: thumb),
              ),
              Gaps.h16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              userId,
                              style: TextStyle(
                                color:
                                    ref.watch(darkModeConfigProvider).darkMode
                                        ? Colors.white
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "2h",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Gaps.h10,
                            IconButton(
                              onPressed: () => _onThreeDotTap(context),
                              icon: Icon(
                                Icons.more_horiz,
                                color:
                                    ref.watch(darkModeConfigProvider).darkMode
                                        ? Colors.grey.shade400
                                        : Colors.black,
                                size: Sizes.size28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: ref.watch(darkModeConfigProvider).darkMode
                            ? Colors.grey.shade300
                            : Colors.black,
                      ),
                    ),
                    if (images.isNotEmpty)
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var image in images)
                              Container(
                                clipBehavior: Clip.hardEdge,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                width: 300,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.network(
                                  image, // 여기에 실제 이미지 URL을 넣으세요
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ),
                    Gaps.v10,
                    Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: ref.watch(darkModeConfigProvider).darkMode
                              ? Colors.grey.shade200
                              : Colors.black,
                        ),
                        Gaps.h12,
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: ref.watch(darkModeConfigProvider).darkMode
                              ? Colors.grey.shade200
                              : Colors.black,
                        ),
                        Gaps.h12,
                        FaIcon(
                          FontAwesomeIcons.share,
                          color: ref.watch(darkModeConfigProvider).darkMode
                              ? Colors.grey.shade200
                              : Colors.black,
                        ),
                        Gaps.h12,
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: ref.watch(darkModeConfigProvider).darkMode
                              ? Colors.grey.shade200
                              : Colors.black,
                        ),
                      ],
                    ),
                    Gaps.v14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${comments.toString()} replies",
                          style: TextStyle(
                            color: ref.watch(darkModeConfigProvider).darkMode
                                ? Colors.grey.shade200
                                : Colors.black,
                          ),
                        ),
                        Gaps.h12,
                        Text(
                          "${likes.toString()} likes",
                          style: TextStyle(
                            color: ref.watch(darkModeConfigProvider).darkMode
                                ? Colors.grey.shade200
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
