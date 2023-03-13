import 'dart:convert';

import 'package:flutter_products_store/infrastructure/dtos/volume_info_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/constants.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  final volumeInfoDto = defaultVolumeInfoDto;
  final volumeInfoEntity = defaultVolumeInfoEntity;

  group("VolumeInfoDto test", () {
    test('fromDomain, should return a valid model', () async {
      final result = VolumeInfoDto.fromDomain(volumeInfoEntity);
      expect(result.description, volumeInfoDto.description);
      expect(result.pageCount, volumeInfoDto.pageCount);
    });

    test('toJson, should return a valid json', () async {
      final result = volumeInfoDto.toJson();
      expect(result["pageCount"], volumeInfoDto.pageCount);
      expect(result["description"], volumeInfoDto.description);
    });

    test('toDomain, should return a valid model', () async {
      final result = volumeInfoDto.toDomain();
      expect(result.description, volumeInfoEntity.description);
      expect(result.pageCount, volumeInfoEntity.pageCount);
    });

    test('fromJson, should return a valid json map', () async {
      final jsonMap = jsonDecode(fixture("books.json")) as Map<String, dynamic>;
      final result =
          VolumeInfoDto.fromJson(jsonMap['items'].first["volumeInfo"]);
      expect(result.description, volumeInfoDto.description);
      expect(result.pageCount, volumeInfoDto.pageCount);
    });
  });
}
