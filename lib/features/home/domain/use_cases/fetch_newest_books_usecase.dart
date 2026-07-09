import 'package:clean_arch_bookly_app/core/use_cases/use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/home_entity.dart';

class FetchNewestBookUsecase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homerepo;
  FetchNewestBookUsecase(this.homerepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    // TODO: implement call
    return await homerepo.fetchNewestBooks();
  }
}
