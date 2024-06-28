import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class CameraPreviewScreen extends StatefulWidget {
  final XFile picture;
  final bool isPicked;

  const CameraPreviewScreen({
    super.key,
    required this.picture,
    required this.isPicked,
  });

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  bool _savedPicture = false;

  Future<void> _saveToGallery() async {
    if (_savedPicture) return;

    await GallerySaver.saveImage(
      widget.picture.path,
      albumName: "Twtter_clone",
    );
    _savedPicture = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview picture"),
        foregroundColor: Colors.black,
        actions: [
          if (!widget.isPicked)
            IconButton(
              onPressed: _saveToGallery,
              icon: FaIcon(
                _savedPicture
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.download,
              ),
            ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Done",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.file(File(widget.picture.path)),
        ],
      ),
    );
  }
}
