import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/repos/HomeRepoImpl.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepoImpl) : super(FeaturedBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> FetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepoImpl.FetchFeaturedBooks();
    result.fold(
        (failure) => {
              emit(
                FeaturedBooksFailure(failure.errormessage),
              ),
            },
        (books) => {
              emit(
                FeaturedBooksSuccess(books),
              ),
            });
  }
}
