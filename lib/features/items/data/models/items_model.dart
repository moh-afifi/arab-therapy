import 'package:therapy/features/items/domain/entities/items_entity.dart';

class ItemsModel extends ItemsEntity {
  ItemsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalPhotos = json['total_photos'];
    message = json['message'];
    offset = json['offset'];
    limit = json['limit'];
    if (json['photos'] != null) {
      itemsList = <PhotoModel>[];
      json['photos'].forEach((v) {
        itemsList.add(PhotoModel.fromJson(v));
      });
    }
  }
}

class PhotoModel extends ItemEntity {
  PhotoModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    user = json['user'];
    description = json['description'];
    id = json['id'];
  }
}
