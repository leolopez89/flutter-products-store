import 'package:flutter_products_store/domain/entities/book_entity.dart';
import 'package:flutter_products_store/domain/entities/books_entity.dart';
import 'package:flutter_products_store/domain/entities/image_links_entity.dart';
import 'package:flutter_products_store/domain/entities/list_price_entity.dart';
import 'package:flutter_products_store/domain/entities/sale_info_entity.dart';
import 'package:flutter_products_store/domain/entities/user_entity.dart';
import 'package:flutter_products_store/domain/entities/volume_info_entity.dart';
import 'package:flutter_products_store/infrastructure/dtos/book_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/books_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/image_links_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/list_price_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/sale_info_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/user_dto.dart';
import 'package:flutter_products_store/infrastructure/dtos/volume_info_dto.dart';

//DTOS

final defaultBooksDto = BooksDto(
  kind: "kind",
  totalItems: 1,
  items: [defaultBookDto],
);

final defaultBookDto = BookDto(
  kind: "kind",
  id: "id",
  etag: "etag",
  selfLink: "selfLink",
  volumeInfo: defaultVolumeInfoDto,
  saleInfo: defaultSaleInfoDto,
);

final defaultVolumeInfoDto = VolumeInfoDto(
  title: "title",
  authors: ["authors"],
  publisher: "publisher",
  publishedDate: "publishedDate",
  description: "description",
  pageCount: 1,
  printedPageCount: 1,
  categories: [""],
  imageLinks: defaultImageLinksDto,
  language: "language",
);

final defaultImageLinksDto = ImageLinksDto(
  thumbnail: "thumbnail",
  small: "small",
);

final defaultSaleInfoDto = SaleInfoDto(
  country: "country",
  saleability: "saleability",
  isEbook: true,
  listPrice: defaultListPriceDto,
  buyLink: "buyLink",
);

final defaultListPriceDto = ListPriceDto(
  amount: 1.0,
  currencyCode: "currencyCode",
);
final defaultUserDto = UserDto(
  email: "email",
  password: "password",
);

// ENTITIES

final defaultBooksEntity = BooksEntity(
  kind: "kind",
  totalItems: 1,
  items: [defaultBookEntity],
);

final defaultBookEntity = BookEntity(
  kind: "kind",
  id: "id",
  etag: "etag",
  selfLink: "selfLink",
  volumeInfo: defaultVolumeInfoEntity,
  saleInfo: defaultSaleInfoEntity,
);

final defaultVolumeInfoEntity = VolumeInfoEntity(
  title: "title",
  authors: ["authors"],
  publisher: "publisher",
  publishedDate: "publishedDate",
  description: "description",
  pageCount: 1,
  printedPageCount: 1,
  categories: [""],
  imageLinks: defaultImageLinksEntity,
  language: "language",
);

final defaultImageLinksEntity = ImageLinksEntity(
  thumbnail: "thumbnail",
  small: "small",
);

final defaultSaleInfoEntity = SaleInfoEntity(
  country: "country",
  saleability: "saleability",
  isEbook: true,
  listPrice: defaultListPriceEntity,
  buyLink: "buyLink",
);

final defaultListPriceEntity = ListPriceEntity(
  amount: 1.0,
  currencyCode: "currencyCode",
);

final defaultUserEntity = UserEntity(
  email: "email",
  password: "password",
);
