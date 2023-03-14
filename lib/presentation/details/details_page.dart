import 'package:flutter/material.dart';
import 'package:flutter_products_store/application/details/details_controller.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:get/get.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (_) {
      bool hasCover = _.book.volumeInfo?.imageLinks?.thumbnail != null;
      String price = _.book.saleInfo?.listPrice?.amount.toString() ?? "FREE";
      bool hasPrice = (_.book.saleInfo?.listPrice?.amount ?? 0) > 0;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Product Details'),
          backgroundColor: AppColors.mainColor,
          actions: [
            IconButton(
              key: const Key('toCart'),
              onPressed: _.appState.count > 0 ? _.goToCartPage : null,
              icon: Badge(
                label: Text("${_.appState.count}"),
                alignment: AlignmentDirectional.topEnd,
                child: const Icon(Icons.shopping_cart, size: 45),
              ),
              tooltip: "Logout",
            ),
            const SizedBox(width: 10),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _.back,
          ),
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 250,
            child: hasCover
                ? Image.network(
                    _.book.volumeInfo?.imageLinks?.thumbnail ?? "",
                    fit: BoxFit.fitHeight,
                  )
                : Image.asset("assets/no-cover.png"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: const BoxDecoration(
                color: AppColors.lineColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text(
                  _.book.volumeInfo?.title ?? "No title",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                if ((_.book.volumeInfo?.authors ?? []).isNotEmpty)
                  ..._.book.volumeInfo!.authors!.map((author) => Text(
                        author,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      )),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "\$$price",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: hasPrice
                              ? AppColors.alelrtColor
                              : AppColors.mainColor),
                    ),
                    const Spacer(),
                    if (hasPrice)
                      IconButton(
                          onPressed: _.addToCart,
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.mainColor,
                          ))
                  ],
                ),
                if ((_.book.volumeInfo?.pageCount ?? 0) > 0) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Page Count: ${_.book.volumeInfo!.pageCount}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
                if ((_.book.volumeInfo?.printedPageCount ?? 0) > 0) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Printed Page Count: ${_.book.volumeInfo!.printedPageCount}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
                if ((_.book.volumeInfo?.publisher ?? "").isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Publisher: ${_.book.volumeInfo!.publisher}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
                if ((_.book.volumeInfo?.publishedDate ?? "").isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Published Date: ${_.book.volumeInfo!.publishedDate}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
                if ((_.book.volumeInfo?.language ?? "").isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    "Language: ${_.book.volumeInfo!.language!.toUpperCase()}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
                const SizedBox(height: 10),
                Text(
                  _.book.volumeInfo?.description ?? "",
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 30),
              ]
                  .map((widget) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: widget,
                      ))
                  .toList(),
            ),
          )
        ]),
      );
    });
  }
}
