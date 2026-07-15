import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestBookUsecase}) : super(NewestBooksInitial());
  final FetchNewestBookUsecase fetchNewestBookUsecase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBookUsecase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books){
      emit(NewestBooksSuccess(books));
    }); 
  }

}
