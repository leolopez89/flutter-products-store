import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final bookDto = defaultBookDto;
  final bookEntity = defaultBookEntity;

  group("BookDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = BookDto.fromDomain(bookEntity);
      expect(result.id, bookDto.id);
      expect(result.kind, bookDto.kind);
    });

    test('toJson, should return a valid json', () async {
      final result = bookDto.toJson();
      expect(result["volumeInfo"]["title"], bookDto.volumeInfo?.title);
      expect(result["id"], bookDto.id);
    });

    test('toDomain, should return a valid model', () async {
      final result = bookDto.toDomain();
      expect(result.id, bookEntity.id);
      expect(result.kind, bookEntity.kind);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("book.json")) as Map<String, dynamic>;
      final result = BookDto.fromJson(jsonMap);
      expect(result.id, bookDto.id);
      expect(result.kind, bookDto.kind);
    });
  });
}
