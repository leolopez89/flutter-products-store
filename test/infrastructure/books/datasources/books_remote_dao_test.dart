import 'dart:convert';

import 'package:flutter_products_store/infrastructure/books/datasources/books_remote_dao.dart';
import 'package:flutter_products_store/infrastructure/core/rest_api/rest_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'books_remote_dao_test.mocks.dart';

@GenerateMocks(<Type>[], customMocks: <MockSpec<dynamic>>[
  MockSpec<PublicAccessRestApiClient>(as: #MockPublicAccessRestApiClient),
])
void main() {
  late BooksRemoteDao booksRemoteDao;
  final mockPublicAccessRestApiClient = MockPublicAccessRestApiClient();

  setUp(() {
    booksRemoteDao = BooksRemoteDao(mockPublicAccessRestApiClient);
  });

  test(
    'get, should return a valid object',
    () async {
      String id = "ID";
      String json = fixture("book.json");
      final decoded = jsonDecode(json) as Map<String, dynamic>;

      when(mockPublicAccessRestApiClient.load(
        resource: anyNamed("resource"),
      )).thenAnswer((_) async => decoded);

      final result = await booksRemoteDao.get(id);

      expect(result.id, decoded["id"]);
      expect(true, decoded["id"] != null);
      verify(mockPublicAccessRestApiClient.load(resource: anyNamed("resource")))
          .called(1);
      verifyNoMoreInteractions(mockPublicAccessRestApiClient);
    },
  );

  test(
    'list, should return a valid object',
    () async {
      String id = "ID";
      String json = fixture("books.json");
      final decoded = jsonDecode(json) as Map<String, dynamic>;

      when(mockPublicAccessRestApiClient.load(
        resource: anyNamed("resource"),
        queryParameters: anyNamed("queryParameters"),
      )).thenAnswer((_) async => decoded);

      final result = await booksRemoteDao.list();

      expect(1, decoded["totalItems"]);
      expect(1, result.length);
      expect(result.first.id, decoded["items"].first["id"]);
      verify(mockPublicAccessRestApiClient.load(
        resource: anyNamed("resource"),
        queryParameters: anyNamed("queryParameters"),
      )).called(1);
      verifyNoMoreInteractions(mockPublicAccessRestApiClient);
    },
  );
}
