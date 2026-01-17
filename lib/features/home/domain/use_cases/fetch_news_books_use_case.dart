import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchNewsBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return homeRepo.fetchNewsBooks();
  }
}
