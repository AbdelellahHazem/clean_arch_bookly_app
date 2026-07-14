import 'package:hive_flutter/adapters.dart';
part  'home_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String authorname;
  @HiveField(4)
  final num price;
  @HiveField(5)
  final num rating;
  BookEntity({required this.bookId, required this.image, required this.title, required this.authorname, required this.price,  required this.rating});
}
