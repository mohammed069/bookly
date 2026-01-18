import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    // TODO: implement fetchNewsBooks
    throw UnimplementedError();
  }
}
