import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/home_entity.dart';

class FetchFeaturedBookUsecase {
  final HomeRepo homerepo;
  FetchFeaturedBookUsecase(this.homerepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    return homerepo.fetchFeaturedBooks();
  }
}
