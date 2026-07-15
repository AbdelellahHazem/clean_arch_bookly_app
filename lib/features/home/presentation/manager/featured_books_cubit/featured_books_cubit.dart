import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBookUsecase)
    : super(FeaturedBooksInitial());
  final FetchFeaturedBookUsecase fetchFeaturedBookUsecase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBookUsecase.call();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    }); 
  }
}
