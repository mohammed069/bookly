import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewsBooksUseCase) : super(NewestBooksInitial());

  FetchNewsBooksUseCase fetchNewsBooksUseCase;
  Future<void> fetchNewestBooks() async {
    Either<Failure, List<BookEntity>> result =
        await fetchNewsBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBooksFailure(errorMessage: failure.message));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
