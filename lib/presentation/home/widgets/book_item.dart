import 'package:flutter/material.dart';
import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/presentation/core/utils/decorations.dart';
import 'package:get/get.dart';

class BookItem extends StatelessWidget {
  BookItem({
    super.key,
    required this.book,
    required this.addToCart,
    required this.goToDetails,
  });

  final BookEntity book;
  final VoidCallback addToCart;
  final VoidCallback goToDetails;
  final size = Get.size;

  @override
  Widget build(BuildContext context) {
    bool hasCover = book.volumeInfo?.imageLinks?.thumbnail != null;
    String price = book.saleInfo?.listPrice?.amount.toString() ?? "FREE";
    bool hasPrice = (book.saleInfo?.listPrice?.amount ?? 0) > 0;
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: goToDetails,
      child: Container(
        width: size.width * 0.8,
        height: 200,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.baseTextColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              offset: Offset(0.0, 4.0),
            )
          ],
        ),
        child: Row(children: [
          Container(
            width: size.width * 0.3,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.only(left: 15, right: 25),
            child: hasCover
                ? Image.network(
                    book.volumeInfo?.imageLinks?.thumbnail ?? "",
                    fit: BoxFit.cover,
                  )
                : Image.asset("assets/no-cover.png"),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  book.volumeInfo?.title ?? "No title",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                const SizedBox(height: 10),
                if ((book.volumeInfo?.authors ?? []).isNotEmpty)
                  ...book.volumeInfo!.authors!.take(2).map((author) => Text(
                        author,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )),
                const SizedBox(height: 10),
                Text(
                  "\$$price",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: hasPrice
                          ? AppColors.alelrtColor
                          : AppColors.mainColor),
                ),
                const SizedBox(height: 10),
                Text(
                  book.volumeInfo?.description ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          if (hasPrice)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: addToCart,
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: AppColors.mainColor,
                    ))
              ],
            )
        ]),
      ),
    );
  }
}
