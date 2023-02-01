import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/HomeRepo.dart';
import 'package:bookly/core/utils/ApiService.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/Errors/Failure.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> FetchBestSellerBooks() async {
    try {
      var response = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=subject:programming');
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> FetchFeaturedBooks() async {
    try {
      var response = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks &q=subject:programming');
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
