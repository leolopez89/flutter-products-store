import 'package:flutter_products_store/domain/entities/image_links_entity.dart';

class VolumeInfoEntity {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  int? printedPageCount;
  List<String>? categories;
  ImageLinksEntity? imageLinks;
  String? language;

  VolumeInfoEntity({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.printedPageCount,
    this.categories,
    this.imageLinks,
    this.language,
  });
}
