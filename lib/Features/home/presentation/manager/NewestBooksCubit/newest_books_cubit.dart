import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/HomeRepoImpl.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepoImpl) : super(NewestBooksInitial());

  final HomeRepoImpl homeRepoImpl;
  Future<void> FetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepoImpl.FetchNewestBooks();
    result.fold(
        (failure) => {
              emit(
                NewestBooksFailure(failure.errormessage),
              ),
            },
        (books) => {
              emit(
                NewestBooksSuccess(books),
              ),
            });
  }
}
