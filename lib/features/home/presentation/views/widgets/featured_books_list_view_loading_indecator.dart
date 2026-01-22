import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_loading_indecator.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndecator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomBookImageLoadingIndecator(),
            );
          },
        ),
      ),
    );
  }
}
