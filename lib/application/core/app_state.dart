import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:get/get.dart';

class AppState extends GetxController {
  Set<BookEntity> books = {};

  int get count => books.length;

  double get totalPrice =>
      books.fold(0, (v, e) => v + (e.saleInfo?.listPrice?.amount ?? 0));
}
