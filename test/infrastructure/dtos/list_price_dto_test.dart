import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/list_price_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final listPriceDto = defaultListPriceDto;
  final listPriceEntity = defaultListPriceEntity;

  group("ListPriceDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = ListPriceDto.fromDomain(listPriceEntity);
      expect(result.amount, listPriceDto.amount);
      expect(result.currencyCode, listPriceDto.currencyCode);
    });

    test('toJson, should return a valid json', () async {
      final result = listPriceDto.toJson();
      expect(result["currencyCode"], listPriceDto.currencyCode);
      expect(result["amount"], listPriceDto.amount);
    });

    test('toDomain, should return a valid model', () async {
      final result = listPriceDto.toDomain();
      expect(result.amount, listPriceEntity.amount);
      expect(result.currencyCode, listPriceEntity.currencyCode);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result = ListPriceDto.fromJson(
          jsonMap['items'].first["saleInfo"]["listPrice"]);
      expect(result.amount, listPriceDto.amount);
      expect(result.currencyCode, listPriceDto.currencyCode);
    });
  });
}
