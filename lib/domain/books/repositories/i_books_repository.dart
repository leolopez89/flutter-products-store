import 'package:dartz/dartz.dart';
import 'package:flutter_products_store/domain/core/failures.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';

abstract class IBookRepository {
  Future<Either<IFailure, List<BookEntity>>> list({String? query});
  Future<Either<IFailure, BookEntity>> get(String id);
}
