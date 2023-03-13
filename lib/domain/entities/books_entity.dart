import 'package:flutter_products_store/domain/entities/book_entity.dart';

class BooksEntity {
  String? kind;
  int? totalItems;
  List<BookEntity>? items;

  BooksEntity({this.kind, this.totalItems, this.items});
}
