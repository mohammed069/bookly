import 'package:flutter/material.dart';

class CustomBookImageLoadingIndecator extends StatelessWidget {
  const CustomBookImageLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(color: Colors.white70),
      ),
    );
  }
}
