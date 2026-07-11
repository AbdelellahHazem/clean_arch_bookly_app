import 'package:clean_arch_bookly_app/core/utils/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/home_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endpoint:'volumes?q=subject:programming&printType=books &filter=free-ebooks&orderBy=relevance &maxResults=40&startIndex=0',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
      List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    throw UnimplementedError();
  }
}
