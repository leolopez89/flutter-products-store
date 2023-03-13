import 'package:flutter_products_store/domain/entities/list_price_entity.dart';

class ListPriceDto {
  double? amount;
  String? currencyCode;

  ListPriceDto({this.amount, this.currencyCode});

  ListPriceDto.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currencyCode'] = currencyCode;
    return data;
  }

  ListPriceEntity toDomain() => ListPriceEntity(
        amount: amount,
        currencyCode: currencyCode,
      );

  ListPriceDto.fromDomain(ListPriceEntity? entity)
      : amount = entity?.amount,
        currencyCode = entity?.currencyCode;
}
