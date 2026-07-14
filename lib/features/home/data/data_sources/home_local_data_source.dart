import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchNewestBooks() {
    // Implement your local data fetching logic here
    return [];
  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
    // Implement your local data fetching logic here
    return [];
  }
}