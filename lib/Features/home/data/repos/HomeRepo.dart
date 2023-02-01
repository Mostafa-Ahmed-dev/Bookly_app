import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/Failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> FetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks();
}
