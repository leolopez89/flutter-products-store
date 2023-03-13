import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/books/datasources/i_books_remote_dao.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:flutter_products_store/domain/users/datasources/i_user_local_dao.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/infrastructure/books/datasources/books_remote_dao.dart';
import 'package:flutter_products_store/infrastructure/books/repositories/books_repository.dart';
import 'package:flutter_products_store/infrastructure/core/rest_api/rest_api_client.dart';
import 'package:flutter_products_store/infrastructure/users/datasources/user_local_dao.dart';
import 'package:flutter_products_store/infrastructure/users/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void registerServices() {
  Get.put<AppState>(
    AppState(),
    permanent: true,
  );

  Get.put<PublicAccessRestApiClient>(
    PublicAccessRestApiClient(),
    permanent: true,
  );

  Get.put<IBooksRemoteDao>(
    BooksRemoteDao(Get.find<PublicAccessRestApiClient>()),
    permanent: true,
  );

  Get.put<IBookRepository>(
    BookRepository(Get.find<IBooksRemoteDao>()),
    permanent: true,
  );

  Get.put<IUserLocalDao>(
    UserLocalDao(GetStorage()),
    permanent: true,
  );

  Get.put<IUserRepository>(
    UserRepository(Get.find<IUserLocalDao>()),
    permanent: true,
  );
}
