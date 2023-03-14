import 'package:flutter_products_store/application/core/app_state.dart';
import 'package:flutter_products_store/domain/books/repositories/i_books_repository.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/domain/users/repositories/i_user_repository.dart';
import 'package:flutter_products_store/presentation/core/navigation/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final IBookRepository bookRepository;
  final IUserRepository userRepository;
  final AppState appState;

  bool loading = true;
  SortingMode sorting = SortingMode.relevance;

  List<BookEntity> _books = [];
  final List<BookEntity> _sorted = [];
  List<BookEntity> get booksList =>
      sorting == SortingMode.relevance ? _books : _sorted;

  HomeController({
    required this.bookRepository,
    required this.userRepository,
    required this.appState,
  });

  @override
  void onInit() {
    super.onInit();
    loading = false;
    getBooks();
    update();
  }

  Future<void> getBooks() async {
    loading = true;
    update();

    final results = await bookRepository.list();
    results.fold((error) {
      _books = [];
      Get.snackbar("Error", error.message.body);
      loading = false;
      update();
    }, (results) {
      loading = false;
      _books = results;
      _sort();
      update();
    });
  }

  void switchSort() {
    if (sorting == SortingMode.priceUp) {
      sorting = SortingMode.relevance;
    } else if (sorting == SortingMode.relevance) {
      sorting = SortingMode.priceDown;
    } else {
      sorting = SortingMode.priceUp;
    }
    _sort();
    update();
  }

  void _sort() {
    if (sorting == SortingMode.priceDown) {
      _sorted.clear();
      _sorted.addAll(_books);
      _sorted.sort((a, b) => (a.saleInfo?.listPrice?.amount ?? 0)
          .compareTo(b.saleInfo?.listPrice?.amount ?? 0));
    }
    if (sorting == SortingMode.priceUp) {
      _sorted.clear();
      _sorted.addAll(_books);
      _sorted.sort((b, a) => (a.saleInfo?.listPrice?.amount ?? 0)
          .compareTo(b.saleInfo?.listPrice?.amount ?? 0));
    }
    update();
  }

  void addToCart(int index) {
    appState.books.add(booksList[index]);
    appState.update();
    update();
  }

  goToDetails(int index) =>
      Get.toNamed(Routes.productDetails, arguments: {"book": booksList[index]});

  goToCartPage() => Get.toNamed(Routes.cart);

  logout() {
    userRepository.logout().fold(
          (l) => Get.snackbar("Error", l.message.body),
          (r) => Get.offAllNamed(Routes.login),
        );
  }

  String get sortModeStr => "Sorting by ${sorting.toShortString()}";
}

enum SortingMode {
  relevance,
  priceUp,
  priceDown,
}

extension SortingModeToString on SortingMode {
  String toShortString() {
    switch (this) {
      case SortingMode.relevance:
        return "relevance";
      case SortingMode.priceUp:
        return "higher price";
      case SortingMode.priceDown:
        return "lower price";
    }
  }
}
