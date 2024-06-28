import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:twitter_auth_clone/constant/gaps.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';
import 'package:twitter_auth_clone/features/camera/camera_preview_screen.dart';
import 'package:twitter_auth_clone/features/camera/widgets/flash_icon.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  bool _hasPerimission = false;

  bool _isSelfieMode = false;

  late FlashMode _flashMode;

  late CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }
    _cameraController = CameraController(
        cameras[_isSelfieMode ? 1 : 0], ResolutionPreset.ultraHigh);

    await _cameraController.initialize();

    _flashMode = _cameraController.value.flashMode;
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraDenied) {
      _hasPerimission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_hasPerimission) return;
    if (!_cameraController.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _setFlashMode(FlashMode newFlashMode) async {
    await _cameraController.setFlashMode(newFlashMode);
    _flashMode = newFlashMode;
    setState(() {});
  }

  Future<void> _onTap() async {
    final picture = await _cameraController.takePicture();

    await GallerySaver.saveImage(
      picture.path,
      albumName: "Twtter_clone",
    );

    if (!mounted) return;
    Navigator.pop(context, picture.path);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CameraPreviewScreen(
    //       picture: picture,
    //       isPicked: false,
    //     ),
    //   ),
    // );
  }

  Future<void> _onPickPicturePressed() async {
    final picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (picture == null) return;
    if (!mounted) return;

    Navigator.pop(context, picture.path);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => CameraPreviewScreen(
    //       picture: picture,
    //       isPicked: true,
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPerimission || !_cameraController.value.isInitialized
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: Sizes.size40,
                    left: Sizes.size20,
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: Sizes.size32,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: Sizes.size40,
                    right: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: _toggleSelfieMode,
                          icon: const Icon(
                            Icons.cameraswitch,
                            size: Sizes.size32,
                          ),
                        ),
                        Gaps.v10,
                        FlashIcon(
                          icon: Icons.flash_off_rounded,
                          onSelected: _flashMode == FlashMode.off,
                          onPressed: () => _setFlashMode(FlashMode.off),
                        ),
                        Gaps.v10,
                        FlashIcon(
                          icon: Icons.flash_on_rounded,
                          onSelected: _flashMode == FlashMode.always,
                          onPressed: () => _setFlashMode(FlashMode.always),
                        ),
                        Gaps.v10,
                        FlashIcon(
                          icon: Icons.flash_auto_rounded,
                          onSelected: _flashMode == FlashMode.auto,
                          onPressed: () => _setFlashMode(FlashMode.auto),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: Sizes.size40,
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: _onTap,
                          child: Container(
                            width: Sizes.size72,
                            height: Sizes.size72,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: _onPickPicturePressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.image,
                                color: Colors.white,
                                size: Sizes.size32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
