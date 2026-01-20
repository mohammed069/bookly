import 'package:bloc/bloc.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:dartz/dartz.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    Either<Failure, List<BookEntity>> result =
        await featuredBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errorMessage: failure.message));
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
