import 'package:flutter_products_store/domain/entities/list_price_entity.dart';

class SaleInfoEntity {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPriceEntity? listPrice;
  String? buyLink;

  SaleInfoEntity({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.buyLink,
  });
}
