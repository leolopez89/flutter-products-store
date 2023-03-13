import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/image_links_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final imageLinksDto = defaultImageLinksDto;
  final imageLinksEntity = defaultImageLinksEntity;

  group("ImageLinksDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = ImageLinksDto.fromDomain(imageLinksEntity);
      expect(result.small, imageLinksDto.small);
      expect(result.thumbnail, imageLinksDto.thumbnail);
    });

    test('toJson, should return a valid json', () async {
      final result = imageLinksDto.toJson();
      expect(result["thumbnail"], imageLinksDto.thumbnail);
      expect(result["small"], imageLinksDto.small);
    });

    test('toDomain, should return a valid model', () async {
      final result = imageLinksDto.toDomain();
      expect(result.small, imageLinksEntity.small);
      expect(result.thumbnail, imageLinksEntity.thumbnail);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result = ImageLinksDto.fromJson(
          jsonMap['items'].first["volumeInfo"]["imageLinks"]);
      expect(result.small, imageLinksDto.small);
      expect(result.thumbnail, imageLinksDto.thumbnail);
    });
  });
}
