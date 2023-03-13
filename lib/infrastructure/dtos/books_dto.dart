import 'package:flutter_products_store/domain/entities/books_entity.dart';
import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';

class BooksDto {
  String? kind;
  int? totalItems;
  List<BookDto>? items;

  BooksDto({this.kind, this.totalItems, this.items});

  BooksDto.fromJson(Map<String, dynamic> json)
      : kind = json['kind'],
        totalItems = json['totalItems'],
        items = json['items'] != null
            ? json['items']
                .map((item) => BookDto.fromJson(item))
                .toList()
                .cast<BookDto>()
            : <BookDto>[];

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'totalItems': totalItems,
        'items': items != null ? items!.map((v) => v.toJson()).toList() : [],
      };

  BooksEntity toDomain() => BooksEntity(
        kind: kind,
        totalItems: totalItems,
        items: items?.map((v) => v.toDomain()).toList(),
      );

  BooksDto.fromDomain(BooksEntity entity)
      : kind = entity.kind,
        totalItems = entity.totalItems,
        items = entity.items != null
            ? entity.items!
                .map((item) => BookDto.fromDomain(item))
                .toList()
                .cast<BookDto>()
            : <BookDto>[];
}
