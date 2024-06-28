import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';

class ThreeDotMenu extends StatefulWidget {
  const ThreeDotMenu({super.key});

  @override
  State<ThreeDotMenu> createState() => _ThreeDotMenuState();
}

class _ThreeDotMenuState extends State<ThreeDotMenu> {
  int _currentIndex = 0;

  void _onTapButton() {
    setState(() {
      _currentIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? null
          : AppBar(
              backgroundColor: context.watch<DarkModeConfigVm>().darkMode
                  ? Colors.black
                  : Colors.white,
              title: Text(
                "Report",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size20,
                    color: context.watch<DarkModeConfigVm>().darkMode
                        ? Colors.grey.shade200
                        : Colors.black),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: context.watch<DarkModeConfigVm>().darkMode
                        ? Colors.grey.shade200
                        : Colors.black),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
              ),
              foregroundColor: Colors.black,
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size28),
        child: _currentIndex == 0
            ? Column(
                children: [
                  Gaps.v32,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.watch<DarkModeConfigVm>().darkMode
                                ? Colors.grey.shade600
                                : Colors.grey.shade100,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14)),
                          ),
                          padding: const EdgeInsets.all(Sizes.size16),
                          child: Text(
                            "Unfollow",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size20,
                              color: context.watch<DarkModeConfigVm>().darkMode
                                  ? Colors.grey.shade300
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v2,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.watch<DarkModeConfigVm>().darkMode
                                ? Colors.grey.shade600
                                : Colors.grey.shade100,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14)),
                          ),
                          padding: const EdgeInsets.all(Sizes.size16),
                          child: Text(
                            "Mute",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size20,
                              color: context.watch<DarkModeConfigVm>().darkMode
                                  ? Colors.grey.shade300
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v24,
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.watch<DarkModeConfigVm>().darkMode
                                ? Colors.grey.shade600
                                : Colors.grey.shade100,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14)),
                          ),
                          padding: const EdgeInsets.all(Sizes.size16),
                          child: Text(
                            "Hide",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size20,
                              color: context.watch<DarkModeConfigVm>().darkMode
                                  ? Colors.grey.shade300
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v2,
                  GestureDetector(
                    onTap: _onTapButton,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.watch<DarkModeConfigVm>().darkMode
                                  ? Colors.grey.shade600
                                  : Colors.grey.shade100,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14)),
                            ),
                            padding: const EdgeInsets.all(Sizes.size16),
                            child: const Text(
                              "Report",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size20,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Why are you reporting this thread?",
                        style: TextStyle(
                          color: context.watch<DarkModeConfigVm>().darkMode
                              ? Colors.grey.shade200
                              : Colors.black,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.v20,
                      const ReportDetails(
                        text: "I just don' like it",
                      ),
                      const ReportDetails(
                        text: "It's unlawful content under NetzDG",
                      ),
                      const ReportDetails(
                        text: "It's spam",
                      ),
                      const ReportDetails(
                        text: "Hate speech or symbols",
                      ),
                      const ReportDetails(
                        text: "Nudity or sexual activity",
                      ),
                      const ReportDetails(
                        text: "I just don' like it",
                      ),
                      const ReportDetails(
                        text: "I just don' like it",
                      ),
                      const ReportDetails(
                        text: "It's unlawful content under NetzDG",
                      ),
                      Gaps.v10,
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class ReportDetails extends StatelessWidget {
  final String text;
  const ReportDetails({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
            vertical: Sizes.size14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: context.watch<DarkModeConfigVm>().darkMode
                      ? Colors.grey.shade200
                      : Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: Sizes.size16,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: Sizes.size20,
                color: Colors.black38,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
