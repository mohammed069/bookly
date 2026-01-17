import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call([P parameter]);
}
