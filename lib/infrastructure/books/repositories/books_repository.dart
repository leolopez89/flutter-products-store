import 'package:dartz/dartz.dart';
import 'package:flutter_products_store/domain/books/datasources/i_books_remote_dao.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:flutter_products_store/domain/core/failures.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/infrastructure/core/process_exception.dart';

class BookRepository with ProcessException implements IBookRepository {
  IBooksRemoteDao remote;

  BookRepository(this.remote);

  @override
  Future<Either<IFailure, BookEntity>> get(String id) async {
    return process<BookEntity>(doRequest: () async {
      final result = await remote.get(id);
      final book = result.toDomain();
      return book;
    });
  }

  @override
  Future<Either<IFailure, List<BookEntity>>> list({String? query}) async {
    return process<List<BookEntity>>(doRequest: () async {
      final result = await remote.list(query: query);
      final books = result.map((e) => e.toDomain()).toList();
      return books;
    });
  }
}
