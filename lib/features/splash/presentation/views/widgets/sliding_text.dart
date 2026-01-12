import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAinmation});

  final Animation<Offset> slidingAinmation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAinmation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAinmation,
          child: const Text('Read Free Books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
