import 'package:flutter_products_store/domain/entities/volume_info_entity.dart';
import 'package:flutter_products_store/infrastructure/dtos/image_links_dto.dart';

class VolumeInfoDto {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  int? printedPageCount;
  List<String>? categories;
  ImageLinksDto? imageLinks;
  String? language;

  VolumeInfoDto({
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

  VolumeInfoDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors = (json['authors'] ?? []).cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    pageCount = json['pageCount'];
    printedPageCount = json['printedPageCount'];
    categories = (json['categories'] ?? []).cast<String>();
    imageLinks = json['imageLinks'] != null
        ? ImageLinksDto.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['authors'] = authors;
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['description'] = description;
    data['pageCount'] = pageCount;
    data['printedPageCount'] = printedPageCount;
    data['categories'] = categories;
    if (imageLinks != null) {
      data['imageLinks'] = imageLinks!.toJson();
    }
    data['language'] = language;
    return data;
  }

  VolumeInfoEntity toDomain() => VolumeInfoEntity(
        title: title,
        authors: authors,
        publisher: publisher,
        publishedDate: publishedDate,
        description: description,
        pageCount: pageCount,
        printedPageCount: printedPageCount,
        categories: categories,
        imageLinks: imageLinks?.toDomain(),
        language: language,
      );

  VolumeInfoDto.fromDomain(VolumeInfoEntity? entity)
      : title = entity?.title,
        authors = entity?.authors,
        publisher = entity?.publisher,
        publishedDate = entity?.publishedDate,
        description = entity?.description,
        pageCount = entity?.pageCount,
        printedPageCount = entity?.printedPageCount,
        categories = entity?.categories,
        imageLinks = ImageLinksDto.fromDomain(entity?.imageLinks),
        language = entity?.language;
}
