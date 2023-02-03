import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/repos/HomeRepoImpl.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepoImpl) : super(SimilarInitial());

  final HomeRepoImpl homeRepoImpl;
  Future<void> FetchSimilarBooks({required category}) async {
    emit(SimilarLoading());
    var result = await homeRepoImpl.FetchSimilarBooks(category: category);
    result.fold(
        (failure) => {
              emit(
                SimilarFailure(failure.errormessage),
              ),
            },
        (books) => {
              emit(
                SimilarSuccess(books),
              ),
            });
  }
}
