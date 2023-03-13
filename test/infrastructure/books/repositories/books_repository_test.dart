import 'dart:convert';

import 'package:flutter_products_store/domain/books/datasources/i_books_remote_dao.dart';
import 'package:flutter_products_store/infrastructure/books/repositories/books_repository.dart';
import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/books_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'books_repository_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<IBooksRemoteDao>(as: #MockIBooksRemoteDao),
])
void main() {
  MockIBooksRemoteDao mockIRemoteDao = MockIBooksRemoteDao();
  BookRepository appRepository = BookRepository(mockIRemoteDao);

  test('get, should return a valid object', () async {
    final jsonMap = jsonDecode(fixture("book.json"));
    final bookDto = BookDto.fromJson(jsonMap);
    const id = "ID";
    when(mockIRemoteDao.get(id)).thenAnswer((_) async => bookDto);

    final result = await appRepository.get(id);

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.id != null, true));

    verify(mockIRemoteDao.get(any)).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });

  test('list, should return a valid object', () async {
    final jsonMap = jsonDecode(fixture("books.json"));
    final booksDto = BooksDto.fromJson(jsonMap);
    when(mockIRemoteDao.list())
        .thenAnswer((_) async => Future.value(booksDto.items));

    final result = await appRepository.list();

    expect(result.isRight(), true);
    result.fold((failure) => fail("Should finish successfuly"),
        (result) => expect(result.length, 1));

    verify(mockIRemoteDao.list()).called(1);
    verifyNoMoreInteractions(mockIRemoteDao);
  });
}
