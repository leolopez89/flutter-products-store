import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/sale_info_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final saleInfoDto = defaultSaleInfoDto;
  final saleInfoEntity = defaultSaleInfoEntity;

  group("SaleInfoDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = SaleInfoDto.fromDomain(saleInfoEntity);
      expect(result.buyLink, saleInfoDto.buyLink);
      expect(result.country, saleInfoDto.country);
    });

    test('toJson, should return a valid json', () async {
      final result = saleInfoDto.toJson();
      expect(result["country"], saleInfoDto.country);
      expect(result["buyLink"], saleInfoDto.buyLink);
    });

    test('toDomain, should return a valid model', () async {
      final result = saleInfoDto.toDomain();
      expect(result.buyLink, saleInfoEntity.buyLink);
      expect(result.country, saleInfoEntity.country);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result = SaleInfoDto.fromJson(jsonMap['items'].first["saleInfo"]);
      expect(result.buyLink, saleInfoDto.buyLink);
      expect(result.country, saleInfoDto.country);
    });
  });
}
