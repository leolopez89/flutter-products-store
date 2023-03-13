import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/books_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final booksDto = defaultBooksDto;
  final booksEntity = defaultBooksEntity;

  group("BooksDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = BooksDto.fromDomain(booksEntity);
      expect(result.totalItems, booksDto.totalItems);
      expect(result.kind, booksDto.kind);
    });

    test('toJson, should return a valid json', () async {
      final result = booksDto.toJson();
      expect(result["kind"], booksDto.kind);
      expect(result["totalItems"], booksDto.totalItems);
    });

    test('toDomain, should return a valid model', () async {
      final result = booksDto.toDomain();
      expect(result.totalItems, booksEntity.totalItems);
      expect(result.kind, booksEntity.kind);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result = BooksDto.fromJson(jsonMap);
      expect(result.totalItems, booksDto.totalItems);
      expect(result.kind, booksDto.kind);
    });
  });
}
