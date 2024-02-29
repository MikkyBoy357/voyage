import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  const IconTile({
    super.key,
    required this.path,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height ?? 24,
      width: width ?? 24,
      fit: height != null ? BoxFit.contain : null,
      // color: Colors.black,
    );
  }
}
