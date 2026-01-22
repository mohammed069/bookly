import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int page = 0}) async {
    if (page == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginaionLoading());
    }

    Either<Failure, List<BookEntity>> result = await featuredBooksUseCase.call(
      page: page,
    );

    result.fold(
      (failure) {
        if (page == 0) {
          emit(FeaturedBooksFailure(errorMessage: failure.message));
        } else {
          emit(FeaturedBooksPaginationFailure(errorMessage: failure.message));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
