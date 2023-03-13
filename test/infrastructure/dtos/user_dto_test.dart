import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final saleInfoDto = defaultUserDto;
  final saleInfoEntity = defaultUserEntity;

  group("UserDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = UserDto.fromDomain(saleInfoEntity);
      expect(result.email, saleInfoDto.email);
      expect(result.password, saleInfoDto.password);
    });

    test('toJson, should return a valid json', () async {
      final result = saleInfoDto.toJson();
      expect(result["password"], saleInfoDto.password);
      expect(result["email"], saleInfoDto.email);
    });

    test('toDomain, should return a valid model', () async {
      final result = saleInfoDto.toDomain();
      expect(result.email, saleInfoEntity.email);
      expect(result.password, saleInfoEntity.password);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("user.json")) as Map<String, dynamic>;
      final result = UserDto.fromJson(jsonMap);
      expect(result.email, saleInfoDto.email);
      expect(result.password, saleInfoDto.password);
    });
  });
}
