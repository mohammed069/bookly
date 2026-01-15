import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      spacing: 10,
      children: [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F)),
        Text('4.8', style: Styles.textStyle16),
        Text('(2390)', style: Styles.textStyle14),
      ],
    );
  }
}
