part of 'similar_cubit.dart';

abstract class SimilarState extends Equatable {
  const SimilarState();

  @override
  List<Object> get props => [];
}

class SimilarInitial extends SimilarState {}

class SimilarSuccess extends SimilarState {
  final List<BookModel> books;

  const SimilarSuccess(this.books);
}

class SimilarFailure extends SimilarState {
  final String errormessage;

  const SimilarFailure(this.errormessage);
}

class SimilarLoading extends SimilarState {}
