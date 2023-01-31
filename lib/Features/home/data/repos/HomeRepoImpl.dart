import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/HomeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/Errors/Failure.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> FetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
