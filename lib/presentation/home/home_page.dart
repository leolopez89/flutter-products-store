import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/home/home_controller.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:flutter_products_store/presentation/home/widgets/book_item.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Product List'),
          backgroundColor: AppColors.mainColor,
          actions: [
            IconButton(
              onPressed: _.switchSort,
              icon: Icon(_.sorting == SortingMode.relevance
                  ? Icons.sort
                  : _.sorting == SortingMode.priceUp
                      ? Icons.trending_down
                      : Icons.trending_up),
              tooltip: _.sortModeStr,
            ),
            IconButton(
              key: const Key('logout'),
              onPressed: _.logout,
              icon: const Icon(Icons.logout),
              tooltip: "Logout",
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        body: _.loading
            ? const Center(
                child: CircularProgressIndicator(color: AppColors.mainColor),
              )
            : RefreshIndicator(
                onRefresh: _.getBooks,
                child: ListView.builder(
                    itemCount: _.booksList.length,
                    itemBuilder: (context, index) {
                      final book = _.booksList[index];
                      return BookItem(
                        book: book,
                        addToCart: () => _.addToCart(index),
                      );
                    })),
        floatingActionButton: FloatingActionButton(
          key: const Key('toCart'),
          onPressed: _.appState.count > 0 ? _.goToCartPage : null,
          backgroundColor: _.appState.count > 0
              ? AppColors.mainColor
              : AppColors.disabledColor,
          child: Badge(
            label: Text("${_.appState.count}"),
            alignment: AlignmentDirectional.topEnd,
            child: const Icon(Icons.shopping_cart, size: 45),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}
