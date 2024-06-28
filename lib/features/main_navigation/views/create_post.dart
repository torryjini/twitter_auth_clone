import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/camera/camera_screen.dart';
import 'package:twitter_auth_clone/features/main_navigation/views/view_model/dark_mode_config_vm.dart';
import 'package:twitter_auth_clone/features/main_navigation/widgets/thumbnail.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  void _onCancelPressed() {
    Navigator.of(context).pop();
  }

  final TextEditingController _controller = TextEditingController();

  String? _picturePath;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onBodyTap() {
    FocusScope.of(context).unfocus();
  }

  Future<void> _onClipTap() async {
    final picturePath = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );
    if (_picturePath != null) {
      setState(() {
        _picturePath = picturePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size10),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: context.watch<DarkModeConfigVm>().darkMode
              ? Colors.grey.shade200
              : Colors.black,
          title: const Text(
            "New thread",
          ),
          elevation: 1,
          centerTitle: true,
          leadingWidth: Sizes.size64,
          leading: GestureDetector(
            onTap: _onCancelPressed,
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.size12),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: context.watch<DarkModeConfigVm>().darkMode
                          ? Colors.grey.shade200
                          : Colors.black,
                      fontSize: Sizes.size12),
                ),
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: _onBodyTap,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.size20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Thumbnail(thumb: 'https://picsum.photos/200'),
                  Gaps.h16,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "nomad_mj",
                          style: TextStyle(
                            color: context.watch<DarkModeConfigVm>().darkMode
                                ? Colors.grey.shade200
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size20,
                          ),
                        ),
                        TextField(
                          minLines: null,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Start a thread...",
                            border: InputBorder.none,
                          ),
                        ),
                        _picturePath == null
                            ? GestureDetector(
                                onTap: _onClipTap,
                                child: FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color:
                                      context.watch<DarkModeConfigVm>().darkMode
                                          ? Colors.grey.shade200
                                          : Colors.grey.shade600,
                                ),
                              )
                            : FractionallySizedBox(
                                widthFactor: 0.7,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.file(
                                    File(_picturePath!),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: context.watch<DarkModeConfigVm>().darkMode
              ? Colors.grey.shade900
              : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Anyone can reply",
                  style: TextStyle(
                    color: context.watch<DarkModeConfigVm>().darkMode
                        ? Colors.white
                        : Colors.grey.shade400,
                    fontSize: Sizes.size16,
                  ),
                ),
                TextButton(
                  onPressed: _controller.text.isNotEmpty
                      ? () {
                          Navigator.pop(context);
                        }
                      : null,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _controller.text.isNotEmpty ? 1 : 0.5,
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
