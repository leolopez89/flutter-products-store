import 'package:flutter_products_store/domain/books/datasources/i_books_remote_dao.dart';
import 'package:flutter_products_store/infrastructure/core/constants.dart';
import 'package:flutter_products_store/infrastructure/core/rest_api/rest_api_client.dart';
import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/books_dto.dart';

class BooksRemoteDao implements IBooksRemoteDao {
  final PublicAccessRestApiClient restApiClient;

  BooksRemoteDao(this.restApiClient);

  @override
  Future<BookDto> get(String id) async {
    final response = await restApiClient.load(
      resource: "${ApiEndpoint.volumes}/$id",
    );
    final book = BookDto.fromJson(response as Map<String, dynamic>);
    return book;
  }

  @override
  Future<List<BookDto>> list({String? query}) async {
    final queryParameters = {
      "q": (query ?? "").isEmpty ? "Action" : query,
      "maxResults": 30,
    };
    final response = await restApiClient.load(
        resource: ApiEndpoint.volumes, queryParameters: queryParameters);
    final books = BooksDto.fromJson(response).items ?? <BookDto>[];

    return books;
  }
}
