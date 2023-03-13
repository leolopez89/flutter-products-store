import 'package:flutter_products_store/domain/entities/sale_info_entity.dart';
import 'package:flutter_products_store/infrastructure/dtos/list_price_dto.dart';

class SaleInfoDto {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPriceDto? listPrice;
  String? buyLink;

  SaleInfoDto({
    this.country,
    this.saleability,
    bool? isEbook,
    this.listPrice,
    this.buyLink,
  });

  SaleInfoDto.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    listPrice = json['listPrice'] != null
        ? ListPriceDto.fromJson(json['listPrice'])
        : null;
    buyLink = json['buyLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['saleability'] = saleability;
    if (listPrice != null) {
      data['listPrice'] = listPrice!.toJson();
    }
    data['buyLink'] = buyLink;
    return data;
  }

  SaleInfoEntity toDomain() => SaleInfoEntity(
        country: country,
        saleability: saleability,
        isEbook: isEbook,
        listPrice: listPrice?.toDomain(),
        buyLink: buyLink,
      );

  SaleInfoDto.fromDomain(SaleInfoEntity? entity)
      : country = entity?.country,
        saleability = entity?.saleability,
        isEbook = entity?.isEbook,
        listPrice = ListPriceDto.fromDomain(entity?.listPrice),
        buyLink = entity?.buyLink;
}
