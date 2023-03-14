import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/cart/cart_controller.dart';
import 'package:flutter_products_store/presentation/cart/widgets/book_element.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Shopping Cart'),
          backgroundColor: AppColors.mainColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _.back,
          ),
        ),
        body: ListView.builder(
            itemCount: _.appState.books.length,
            itemBuilder: (context, index) {
              final book = _.appState.books.toList()[index];
              return BookElement(
                book: book,
                removeFromCart: () => _.removeFromCart(book),
              );
            }),
        floatingActionButton: SizedBox(
          width: Get.size.width * 0.8,
          child: ElevatedButton(
            key: const Key('toCart'),
            onPressed: _.appState.totalPrice > 0 ? _.goToCheckoutPage : null,
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColors.mainColor),
            child: Text("CHECKOUT: ${_.appState.totalPrice}"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
