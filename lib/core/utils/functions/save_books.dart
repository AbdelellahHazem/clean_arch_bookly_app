import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> saveBooksData(List<BookEntity> books,String boxName) async {
    var box = await Hive.openBox(boxName);
    box.addAll(books);
  }