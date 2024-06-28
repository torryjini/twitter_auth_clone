import 'package:flutter/material.dart';
import 'package:twitter_auth_clone/constant/sizes.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    super.key,
    required this.thumb,
  });

  final String thumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size36,
      height: Sizes.size36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2.0),
      ),
      child: ClipOval(
        child: Image.network(
          thumb, // 여기에 실제 이미지 URL을 넣으세요
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
