import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/application/details/details_controller.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:get/get.dart';

class DetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(
        bookRepository: Get.find<IBookRepository>(),
        appState: Get.find<AppState>(),
        screenArgs: Get.arguments,
      ),
      fenix: true,
    );
  }
}
