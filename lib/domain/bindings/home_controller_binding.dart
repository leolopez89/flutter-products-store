import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/application/home/home_controller.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        bookRepository: Get.find<IBookRepository>(),
        appState: Get.find<AppState>(),
      ),
      fenix: true,
    );
  }
}
