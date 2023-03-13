import 'package:flutter_products_store/domain/entities/image_links_entity.dart';

class ImageLinksDto {
  String? thumbnail;
  String? small;

  ImageLinksDto({
    this.thumbnail,
    this.small,
  });

  ImageLinksDto.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumbnail'] = thumbnail;
    data['small'] = small;
    return data;
  }

  ImageLinksEntity toDomain() => ImageLinksEntity(
        thumbnail: thumbnail,
        small: small,
      );

  ImageLinksDto.fromDomain(ImageLinksEntity? entity)
      : thumbnail = entity?.thumbnail,
        small = entity?.small;
}
