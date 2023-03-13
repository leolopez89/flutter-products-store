import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';

abstract class IBooksRemoteDao {
  Future<List<BookDto>> list({String? query});
  Future<BookDto> get(String id);
}
