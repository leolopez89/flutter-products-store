import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/infrastructure/dtos/sale_info_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/volume_info_dto.dart';

class BookDto {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfoDto? volumeInfo;
  SaleInfoDto? saleInfo;

  BookDto({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  });

  BookDto.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfoDto.fromJson(json['volumeInfo'])
        : null;
    saleInfo = json['saleInfo'] != null
        ? SaleInfoDto.fromJson(json['saleInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['id'] = id;
    data['etag'] = etag;
    data['selfLink'] = selfLink;
    if (volumeInfo != null) {
      data['volumeInfo'] = volumeInfo!.toJson();
    }
    if (saleInfo != null) {
      data['saleInfo'] = saleInfo!.toJson();
    }
    return data;
  }

  BookEntity toDomain() => BookEntity(
        kind: kind,
        id: id,
        etag: etag,
        selfLink: selfLink,
        volumeInfo: volumeInfo?.toDomain(),
        saleInfo: saleInfo?.toDomain(),
      );

  BookDto.fromDomain(BookEntity entity)
      : kind = entity.kind,
        id = entity.id,
        etag = entity.etag,
        selfLink = entity.selfLink,
        volumeInfo = VolumeInfoDto.fromDomain(entity.volumeInfo),
        saleInfo = SaleInfoDto.fromDomain(entity.saleInfo);
}
