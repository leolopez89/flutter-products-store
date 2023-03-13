import 'package:flutter_products_store/domain/entities/sale_info_entity.dart';
import 'package:flutter_products_store/domain/entities/volume_info_entity.dart';

class BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfoEntity? volumeInfo;
  SaleInfoEntity? saleInfo;

  BookEntity({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
  });
}
