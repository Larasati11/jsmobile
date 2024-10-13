import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String imageAsset;
  final String tag;

  const HeroImage({Key? key, required this.imageAsset, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image.asset(
        imageAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}
