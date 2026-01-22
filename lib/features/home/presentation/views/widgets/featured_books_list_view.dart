import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _controller = ScrollController();

  int nextPage = 1;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() async {
    final position = _controller.position;
    if (!position.hasPixels || !position.hasContentDimensions) return;

    final progress = position.pixels / position.maxScrollExtent;

    if (progress >= 0.85 && !isLoading) {
      isLoading = true;
      await BlocProvider.of<FeaturedBooksCubit>(
        context,
      ).fetchFeaturedBooks(page: nextPage++);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBookItem(imageUrl: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
