import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchNewestBooks() {
   var box = Hive.box<BookEntity>('KNewestBox');
    return box.values.toList();

  }

  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>('KFeaturedBox');
    return box.values.toList();
  }
}