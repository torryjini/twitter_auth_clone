import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/onboarding/interest_detail_screen.dart';
import 'package:twitter_auth_clone/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _selectedInterests = [];

  void _onSelected(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestDetailScreen(
          interestList: _selectedInterests,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: Sizes.size36,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  color: Colors.grey.shade600,
                ),
              ),
              Gaps.v20,
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.size5,
                ),
                height: Sizes.size1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
              ),
              Gaps.v20,
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (var interest in interests)
                      InterestButton(
                        isContained: _selectedInterests.contains(interest),
                        interest: interest,
                        isSelectable: true,
                        onSelected: () {
                          _onSelected(interest);
                        },
                      ),
                  ],
                ),
              ),
              Gaps.v32,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size72,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _selectedInterests.length < 3
                    ? "${_selectedInterests.length} of 3 Selected"
                    : "Great work 🎉",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.grey.shade500,
                ),
              ),
              GestureDetector(
                onTap: _selectedInterests.length > 2 ? _onNextTap : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16, vertical: Sizes.size6),
                  decoration: BoxDecoration(
                    color: _selectedInterests.length > 2
                        ? Colors.black
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: _selectedInterests.length > 2
                          ? Colors.white
                          : Colors.grey.shade400,
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
