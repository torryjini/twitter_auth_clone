import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  static const routeUrl = "/";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.threads,
          size: Sizes.size36,
          color: context.watch<DarkModeConfigVm>().darkMode
              ? Colors.white
              : Colors.black,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            children: [
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "tropicalseductions",
                content: "Drop a comment here to test things out.",
                comments: 2,
                likes: 4,
                images: [],
              ),
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "shityoushouldcareabout",
                content:
                    "my phone feels like a vibrator with all thies notifications rn",
                comments: 64,
                likes: 631,
                images: [],
              ),
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "_plantswithkrystal_",
                content:
                    "If you're reading this, go water tha thirsty plant. You're welcome",
                comments: 8,
                likes: 74,
                images: [],
              ),
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "tropicalseductions",
                content: "Drop a comment here to test things out.",
                comments: 2,
                likes: 4,
                images: ['https://picsum.photos/200/300'],
              ),
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "shityoushouldcareabout",
                content:
                    "my phone feels like a vibrator with all thies notifications rn",
                comments: 64,
                likes: 631,
                images: [
                  'https://picsum.photos/200/300',
                  'https://picsum.photos/200/300'
                ],
              ),
              Post(
                thumb: 'https://picsum.photos/200',
                userId: "_plantswithkrystal_",
                content:
                    "If you're reading this, go water tha thirsty plant. You're welcome",
                comments: 8,
                likes: 74,
                images: [
                  'https://picsum.photos/200/300',
                  'https://picsum.photos/200/300',
                  'https://picsum.photos/200/300'
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
